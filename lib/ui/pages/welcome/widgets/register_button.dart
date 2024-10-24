import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/theme/color.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
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
