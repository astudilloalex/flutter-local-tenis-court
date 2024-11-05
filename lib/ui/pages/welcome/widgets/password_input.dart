import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/input_prefix_icon.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.controller,
    this.validator,
    this.labelText,
  });

  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final String? labelText;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20.0,
        ),
        labelText: widget.labelText ?? AppLocalizations.of(context)!.password,
        prefixIcon: const InputPrefixIcon(
          iconData: Icons.lock_outline_rounded,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => visiblePassword = !visiblePassword);
          },
          icon: Icon(
            visiblePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      obscureText: !visiblePassword,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
