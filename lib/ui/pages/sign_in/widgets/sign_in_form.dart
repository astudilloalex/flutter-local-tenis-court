import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/input_prefix_icon.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/password_input.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20.0,
              ),
              labelText: AppLocalizations.of(context)!.email,
              prefixIcon: const InputPrefixIcon(
                iconData: Icons.email_outlined,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          PasswordInput(
            controller: context.read<SignInBloc>().passwordController,
          ),
        ],
      ),
    );
  }
}
