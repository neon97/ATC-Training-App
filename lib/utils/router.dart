import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

routeTo(BuildContext _context, Widget route) async {
  final popData = await Navigator.of(_context).push(Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => route)
      : MaterialPageRoute(builder: (context) => route));
  return popData;
}
