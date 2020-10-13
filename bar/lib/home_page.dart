import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Install or Upgrade"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/install');
                    },
                    child: const Text("Install"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/upgrade');
                    },
                    child: const Text("Upgrade"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/GopherSpaceCommunity.png",
                width: 300,
                // height: 400,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: const Text("Settings"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: const Text("About"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
