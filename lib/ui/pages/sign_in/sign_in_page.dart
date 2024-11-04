import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_event.dart';
import 'package:tenis_court/ui/pages/sign_in/widgets/sign_in_app_bar.dart';
import 'package:tenis_court/ui/pages/sign_in/widgets/sign_in_form.dart';
import 'package:tenis_court/ui/pages/sign_in/widgets/sign_in_remember_me_checkbox.dart';
import 'package:tenis_court/ui/theme/color_extension.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SignInAppBar(),
          SliverList.list(
            children: [
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 70.0,
                    height: 1.0,
                    color: const Color(0xFF346BC3),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SignInForm(),
              ),
              const SizedBox(height: 8.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SignInRememberMeCheckbox(),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      AppLocalizations.of(context)!.forgotYourPassword,
                      style: TextStyle(
                        color:
                            Theme.of(context).extension<ColorExtension>()?.link,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SignInBloc>().add(const SignInEventSubmit());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text.rich(
                  TextSpan(
                    text:
                        '${AppLocalizations.of(context)!.stillDoNotHaveAnAccount} ',
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<ColorExtension>()
                                  ?.link,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
