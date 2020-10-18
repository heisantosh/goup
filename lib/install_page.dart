import 'package:Goup/appbar.dart';
import 'package:Goup/notification.dart';
import 'package:flutter/material.dart';

class InstallPage extends StatelessWidget {
  final notifier = Notifier.create(() {
    print('upgrading Go version!');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Install'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Install page"),
            RaisedButton(
              child: Text('Notify'),
              onPressed: () {
                notifier.notify(
                  'New Go version 1.15.2 available',
                  'Upgrade to new version?',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
