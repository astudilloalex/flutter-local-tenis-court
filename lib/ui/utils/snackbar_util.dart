import 'package:flutter/material.dart';
import 'package:tenis_court/ui/widgets/custom_snackbar.dart';

enum SnackbarType {
  error,
  info,
  success,
  warning,
}

class SnackbarUtil {
  const SnackbarUtil._();

  static void showSnackbar(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
    IconData icon = Icons.info_outline,
  }) {
    final ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
    messengerState.hideCurrentSnackBar();
    messengerState.showSnackBar(
      SnackBar(
        content: CustomSnackbar(
          message: message,
          backgroundColor: _getColor(type),
          icon: _getIcon(type),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static IconData _getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return Icons.error_outline_outlined;
      case SnackbarType.info:
        return Icons.info_outline_rounded;
      case SnackbarType.success:
        return Icons.check_circle_outline_outlined;
      case SnackbarType.warning:
        return Icons.warning_amber_outlined;
    }
  }

  static Color _getColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return Colors.red;
      case SnackbarType.warning:
        return Colors.orange;
      case SnackbarType.info:
        return Colors.blue;
      case SnackbarType.success:
        return Colors.green;
    }
  }
}
