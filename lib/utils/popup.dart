import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

popup(
  BuildContext context,
  String message,
  bool show,
) {
  if (show == true) {
    Navigator.of(context).pop();
  }
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Platform.isIOS == true
          ? CupertinoAlertDialog(
              title: Text("Alert"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("OK"))
              ],
            )
          : AlertDialog(
              title: Text("Alert"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("OK"))
              ],
            ));
}
