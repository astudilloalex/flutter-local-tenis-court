import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/theme/color.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.go(RouteName.signUp);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColor.snow.withOpacity(0.30),
        ),
        child: Text(
          AppLocalizations.of(context)!.register,
        ),
      ),
    );
  }
}
