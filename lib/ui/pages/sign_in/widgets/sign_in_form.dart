import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/input_prefix_icon.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/password_input.dart';
import 'package:tenis_court/ui/utils/failure_util.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: context.read<SignInBloc>().formKey,
      child: Column(
        children: [
          TextFormField(
            controller: context.read<SignInBloc>().emailController,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20.0,
              ),
              labelText: AppLocalizations.of(context)!.email,
              prefixIcon: const InputPrefixIcon(
                iconData: Icons.email_outlined,
              ),
            ),
            validator: (value) {
              final String? code = context.read<SignInBloc>().validateEmail(
                    value,
                  );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
          ),
          const SizedBox(height: 16.0),
          PasswordInput(
            controller: context.read<SignInBloc>().passwordController,
            validator: (value) {
              final String? code = context.read<SignInBloc>().validatePassword(
                    value,
                  );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
          ),
        ],
      ),
    );
  }
}
