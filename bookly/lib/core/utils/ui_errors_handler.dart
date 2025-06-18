import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:bookly/core/Errors/failure.dart';
import 'package:flutter/material.dart';

class UIErrorHandler {
  static void showError(BuildContext context, Failure failure) {
    switch (failure.uiFeedbackType) {
      case UIFeedbackType.snackbar:
        _showFlushBar(context, failure.message);
        break;

      case UIFeedbackType.dialog:
        _showAwesomeDialog(context, failure.message);
        break;

      case UIFeedbackType.none:
        break;
    }
  }

  static void _showFlushBar(BuildContext context, String message) {
    Flushbar(
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(16),
      backgroundColor: const Color(0xFF100B20),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      messageColor: Colors.white,
      icon: const Icon(Icons.error_outline, color: Colors.white),
    ).show(context);
  }

  static void _showAwesomeDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Oops!',
      desc: message,
      dismissOnTouchOutside: true,
      btnOkOnPress: () {},
      btnOkColor: Colors.white,
      btnOkText: 'Dismiss',
      buttonsTextStyle: const TextStyle(
        color: Color(0xFF100B20),
        fontWeight: FontWeight.bold,
      ),
      dialogBackgroundColor: const Color(0xFF100B20),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      descTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ).show();
  }
}
