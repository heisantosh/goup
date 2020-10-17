import 'package:Goup/appbar.dart';
import 'package:flutter/material.dart';

class UpgradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Upgrade'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Upgrade page"),
            Stepper(
              steps: [
                Step(
                  title: Text('Downloading Go version 1.15'),
                  content: Text('100%'),
                ),
                Step(
                  title: Text('Extracting Go version 1.15'),
                  content: Text('100%'),
                ),
                Step(
                  title: Text('Installing Go version 1.15'),
                  content: Text('80%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
