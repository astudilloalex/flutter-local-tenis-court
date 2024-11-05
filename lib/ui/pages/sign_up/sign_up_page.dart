import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_event.dart';
import 'package:tenis_court/ui/pages/sign_up/widgets/sign_up_app_bar.dart';
import 'package:tenis_court/ui/pages/sign_up/widgets/sign_up_form.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/theme/color_extension.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SignUpAppBar(),
          SliverList.list(
            children: [
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppLocalizations.of(context)!.signUp,
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
                child: SignUpForm(),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(const SignUpEventSubmit());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signUp,
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
                        '${AppLocalizations.of(context)!.iAlreadyHaveAnAccount} ',
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            context.go(RouteName.signIn);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
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
              const SizedBox(height: 16.0),
            ],
          ),
        ],
      ),
    );
  }
}
