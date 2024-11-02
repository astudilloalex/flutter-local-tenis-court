import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_event.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_state.dart';

class SignInRememberMeCheckbox extends StatelessWidget {
  const SignInRememberMeCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignInBloc, SignInState, bool>(
      selector: (state) => state.rememberMe,
      builder: (context, rememberMe) {
        return CheckboxListTile(
          value: rememberMe,
          controlAffinity: ListTileControlAffinity.leading,
          title: Transform.translate(
            offset: const Offset(-16.0, 0),
            child: Text(AppLocalizations.of(context)!.rememberPassword),
          ),
          dense: true,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            final SignInBloc bloc = context.read<SignInBloc>();
            bloc.add(
              SignInEventRememberMeToggled(
                rememberMe: value ?? false,
              ),
            );
          },
        );
      },
    );
  }
}
