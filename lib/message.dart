import 'package:flutter/material.dart';

class ShowMessage {
  Future alert(BuildContext context,
      {@required Widget content, title: 'Informasi'}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: content,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop('ok'),
            ),
          ],
        );
      },
    );
  }

  Future confirm(BuildContext context,
      {@required Widget content, title: 'Konfirmasi'}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: content,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Tidak'),
              onPressed: () => Navigator.of(context).pop('no'),
            ),
            FlatButton(
              child: Text('Iya'),
              onPressed: () => Navigator.of(context).pop('yes'),
            ),
          ],
        );
      },
    );
  }
}
