import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

abstract class NotificationsService {
  static showToastMessage(
      BuildContext context, Color backgroundColor, String message) {
    Toast.show(
      message,
      context,
      backgroundColor: backgroundColor,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.BOTTOM,
    );
  }

  static showConfirmationDialog(BuildContext context, String title,
      String content, Function onConfirmation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            title,
            style: TextStyle(
              color: Color(0xffff0000),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text(
                "Remover",
                style: TextStyle(
                  color: Color(0xffff0000),
                ),
              ),
              onPressed: onConfirmation,
            ),
          ],
        );
      },
    );
  }

  static ProgressDialog showLoadingDialog(
      BuildContext context, String message) {
    return ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
      showLogs: false,
      customBody: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.teal,
              ),
            ),
            SizedBox(width: 15),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
