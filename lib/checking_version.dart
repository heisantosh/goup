import 'package:Goup/appbar.dart';
import 'package:flutter/material.dart';

class CheckingVersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Checking version'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Checking version page"),
          ],
        ),
      ),
    );
  }
}
