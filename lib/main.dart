import 'package:Goup/about_page.dart';
import 'package:Goup/checking_version.dart';
import 'package:Goup/home_page.dart';
import 'package:Goup/install_page.dart';
import 'package:Goup/settings_page.dart';
import 'package:Goup/upgrade_page.dart';
import 'package:flutter/material.dart';
import 'package:args/args.dart';

void main(List<String> args) {
  print('args: $args');
  var parser = ArgParser();
  parser.addFlag('daemon', defaultsTo: false);
  var results = parser.parse(args);

  if (results['daemon'] == true) {
    print('running in background...');
    return;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        "/install": (context) => InstallPage(),
        "/upgrade": (context) => UpgradePage(),
        "/checking_version": (context) => CheckingVersionPage(),
        "/settings": (context) => SettingsPage(),
      },
    );
  }
}
