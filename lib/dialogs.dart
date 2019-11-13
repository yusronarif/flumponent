import 'package:flutter/material.dart';

class Dialog {
  Future<void> alert(BuildContext context, content,
      {title: 'Informasi'}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> confirm(BuildContext context, content,
      {title: 'Konfirmasi'}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop('no');
              },
            ),
            FlatButton(
              child: Text('Iya'),
              onPressed: () {
                Navigator.of(context).pop('yes');
              },
            ),
          ],
        );
      },
    );
  }
}
