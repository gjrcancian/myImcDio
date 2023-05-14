import 'package:flutter/material.dart';

class MySnackBar {

  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}