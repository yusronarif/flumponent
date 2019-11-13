import 'package:flutter/material.dart';

class Nav {
  Future<void> to(BuildContext context, action,
      {bool permanentlyMoved: false}) async {
    if (permanentlyMoved) {
      if (action is Widget) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => action));
      }
      else {
        Navigator.pushReplacementNamed(context, "/$action");
      }
    }
    else {
      if (action is Widget) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => action));
      }
      else {
        Navigator.pushNamed(context, "/$action");
      }
    }
  }

  Future<void> back(BuildContext context, {returnValue: null}) async {
    Navigator.pop(context, returnValue);
  }
}
