

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../colors/colors.dart';

class SnackbarService {
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  static void showSnackbar(
      String message, {
        Color backgroundColor = Colors.blueAccent,
        Duration duration = const Duration(seconds: 4),
        IconData? icon,
      }) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      content: _buildSnackbarContent(message, backgroundColor, icon),
    );

    // Use ScaffoldMessenger to show the SnackBar
    _scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  static Widget _buildSnackbarContent(
      String message, Color backgroundColor, IconData? icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 24),
          if (icon != null) const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



 void showtopmessage(BuildContext context, String text) {
return showTopSnackBar(
Overlay.of(context),
CustomSnackBar.error(
  backgroundColor: app_blu,
message: '$text.',
),
);
}