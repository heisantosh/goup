import 'package:flutter/material.dart';

AppBar createAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    backgroundColor: Colors.white12,
    // shadowColor: Colors.white,
    elevation: 0,
  );
}
