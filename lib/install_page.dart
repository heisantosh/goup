import 'package:Goup/appbar.dart';
import 'package:flutter/material.dart';

class InstallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Install'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Install page"),
          ],
        ),
      ),
    );
  }
}
