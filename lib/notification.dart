import 'package:dbus/dbus.dart';

void sendNotification() async {
  var client = DBusClient.session();
  var object = DBusRemoteObject(client, 'org.freedesktop.Notifications',
      DBusObjectPath('/org/freedesktop/Notifications'));
  var values = [
    DBusString('Goup'), // App name
    DBusUint32(0), // Replaces
    DBusString('application-accessories'), // Icon
    DBusString('Go version 1.15.1 available!'), // Summary
    DBusString('Upgrade to new version?'), // Body
    DBusArray(DBusSignature('s')), // Actions
    DBusDict(DBusSignature('s'), DBusSignature('v')), // Hints
    DBusInt32(-1), // Expire timeout
  ];
  var result = await object.callMethod(
      'org.freedesktop.Notifications', 'Notify', values);
  var id = result.returnValues[0];
  print('notify ${id.toNative()}');
  client.close();
}
