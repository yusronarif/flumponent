import 'package:flutter/material.dart';

class Nav {
  Future<void> to(BuildContext context, action,
      {bool permanentlyMoved: false}) async {
    if (permanentlyMoved) {
      if (action is Widget) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => action));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => action),
            (Route<dynamic> route) => false);
      } else {
        // Navigator.pushReplacementNamed(context, "/$action");
        Navigator.pushNamedAndRemoveUntil(
            context, "/$action", (Route<dynamic> route) => false);
      }
      // Navigator.pop(context);
    } else {
      if (action is Widget) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => action));
      } else {
        Navigator.pushNamed(context, "/$action");
      }
    }
  }

  Future<void> back(BuildContext context, {String returnValue: ''}) async {
    Navigator.pop(context, returnValue);
  }
}
