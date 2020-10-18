import 'package:dbus/dbus.dart';

class Notifier {
  var notificationId;
  var dBusClient;
  void Function() actionInvokedHandler;

  Notifier.create(void Function() handler) {
    notificationId = 0;
    dBusClient = DBusClient.session();
    actionInvokedHandler = handler;
  }

  void close() {
    dBusClient.close();
  }

  void notify(String summary, String body) async {
    var object = DBusRemoteObject(dBusClient, 'org.freedesktop.Notifications',
        DBusObjectPath('/org/freedesktop/Notifications'));
    var values = [
      DBusString('Goup'), // App name
      DBusUint32(notificationId), // Replaces
      DBusString('software-update-available-symbolic'), // Icon
      DBusString(summary), // Summary
      DBusString(body), // Body
      DBusArray(
        DBusSignature('s'),
        [
          DBusString('cancel'),
          DBusString('Cancel'),
          DBusString('upgrade'),
          DBusString('Upgrade'),
        ],
      ), // Actions
      DBusDict(DBusSignature('s'), DBusSignature('v')), // Hints
      DBusInt32(5000), // Expire timeout
    ];
    var result = await object.callMethod(
        'org.freedesktop.Notifications', 'Notify', values);
    notificationId = result.returnValues[0].toNative();
    print('notification ID: $notificationId');

    var signals = object.subscribeSignal(
        'org.freedesktop.Notifications', 'ActionInvoked');
    await for (var signal in signals) {
      var action = signal.values[1].toNative();
      if (action == 'upgrade') {
        actionInvokedHandler();
      }
      break;
    }
  }
}
