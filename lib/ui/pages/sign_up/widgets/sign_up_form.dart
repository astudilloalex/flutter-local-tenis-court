import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/input_prefix_icon.dart';
import 'package:tenis_court/ui/pages/welcome/widgets/password_input.dart';
import 'package:tenis_court/ui/utils/failure_util.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpBloc>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: context.read<SignUpBloc>().namesController,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20.0,
              ),
              labelText: AppLocalizations.of(context)!.firstAndLastName,
              prefixIcon: const InputPrefixIcon(
                iconData: Icons.person_outline_outlined,
              ),
            ),
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              final String? code = context.read<SignUpBloc>().validateNames(
                    value,
                  );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: context.read<SignUpBloc>().emailController,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20.0,
              ),
              labelText: AppLocalizations.of(context)!.email,
              prefixIcon: const InputPrefixIcon(
                iconData: Icons.email_outlined,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final String? code = context.read<SignUpBloc>().validateEmail(
                    value,
                  );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: context.read<SignUpBloc>().phoneController,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minWidth: 20.0,
              ),
              labelText: AppLocalizations.of(context)!.phone,
              prefixIcon: const InputPrefixIcon(
                iconData: Icons.phone_android_outlined,
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              final String? code =
                  context.read<SignUpBloc>().validatePhoneNumber(
                        value,
                      );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
          ),
          const SizedBox(height: 16.0),
          PasswordInput(
            controller: context.read<SignUpBloc>().passwordController,
            validator: (value) {
              final String? code = context.read<SignUpBloc>().validatePassword(
                    value,
                  );
              if (code == null) return null;
              return FailureUtil.mapCode(context, code);
            },
          ),
          const SizedBox(height: 16.0),
          PasswordInput(
            controller: context.read<SignUpBloc>().confirmPasswordController,
            labelText: AppLocalizations.of(context)!.confirmPassword,
            validator: (value) {
              final String? code =
                  context.read<SignUpBloc>().validateConfirmPassword(
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
