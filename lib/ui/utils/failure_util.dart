import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/app/domain/failure.dart';

class FailureUtil {
  const FailureUtil._();

  static String map(BuildContext context, Failure failure) {
    final Map<String, String> data = {
      'user-not-found': AppLocalizations.of(context)!.userNotFound,
    };
    return data[failure.code] ?? failure.code;
  }

  static String mapCode(BuildContext context, String code) {
    final Map<String, String> data = {
      'user-not-found': AppLocalizations.of(context)!.userNotFound,
    };
    return data[code] ?? code;
  }
}
