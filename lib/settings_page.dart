import 'package:Goup/appbar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SettingsPageState extends State<SettingsPage> {
  bool _checkEnabled = false;
  int _checkIntervalDays = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createAppBar('Settings'),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Enable check for new Go version',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Switch(
                  value: _checkEnabled,
                  onChanged: (bool newValue) {
                    setState(() {
                      _checkEnabled = newValue;
                      print('goup check enabled:  $_checkEnabled');
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Check interval in days',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                RawMaterialButton(
                  fillColor: Colors.grey[300],
                  child: Icon(Icons.exposure_plus_1),
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(
                      () {
                        if (_checkIntervalDays > 1000) {
                          print('max days possible is 1000');
                          return;
                        }

                        _checkIntervalDays++;
                        print('increased interval days to $_checkIntervalDays');
                      },
                    );
                  },
                ),
                Text(
                  '$_checkIntervalDays',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                RawMaterialButton(
                  fillColor: Colors.grey[300],
                  child: Icon(Icons.exposure_minus_1),
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(
                      () {
                        if (_checkIntervalDays < 2) {
                          print('min days possible is 1');
                          return;
                        }

                        _checkIntervalDays--;
                        print('decreased interval days to $_checkIntervalDays');
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ));
  }
}
