import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class ShowMessages{
  void showSnackBarRed(title, message) async{
    Get.snackbar(title, message,
      backgroundColor: Colors.black87.withOpacity(0.5),
      colorText: Colors.white,
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.BOTTOM,
      maxWidth: kIsWeb ? 400 : Get.width,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
    );
  }

  void showSnackBarGreen(title, message) async{
    Get.snackbar(title, message,
      backgroundColor: Constants.accentOrange,
      colorText: Colors.white,
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.BOTTOM,
      maxWidth: kIsWeb ? 400 : Get.width,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
    );
  }
}

class YesNoDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function() onYesPressed;
  final Function() onNoPressed;

  YesNoDialog({
    required this.title,
    required this.message,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('No'),
          onPressed: onNoPressed,
        ),
        TextButton(
          child: Text('Yes'),
          onPressed: onYesPressed,
        ),
      ],
    );
  }
}
