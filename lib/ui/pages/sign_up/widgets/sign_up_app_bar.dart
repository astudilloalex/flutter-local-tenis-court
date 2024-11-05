import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tenis_court/app/infrastructure/sources/app_asset.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_state.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/utils/failure_util.dart';
import 'package:tenis_court/ui/utils/snackbar_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/ui/widgets/custom_back_button.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        context.loaderOverlay.hide();
        switch (state) {
          case SignUpStateLoading():
            context.loaderOverlay.show();
          case SignUpStateFailure():
            SnackbarUtil.showSnackbar(
              context,
              message:
                  '${FailureUtil.map(context, state.failure)}${state.failure.message != null ? ' : ${state.failure.message}' : ''}',
              type: SnackbarType.error,
            );
          case SignUpStateSuccess():
            SnackbarUtil.showSnackbar(
              context,
              message: AppLocalizations.of(context)!.successfully,
            );
            context.go(RouteName.welcome);
        }
      },
      child: SliverAppBar(
        leadingWidth: 120.0,
        leading: CustomBackButton(
          onTap: () {
            context.go(RouteName.welcome);
          },
        ),
        expandedHeight: MediaQuery.of(context).size.width * (2 / 3),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            AppAsset.signInHeaderImage,
            fit: BoxFit.cover,
          ),
        ),
        pinned: true,
      ),
    );
  }
}
