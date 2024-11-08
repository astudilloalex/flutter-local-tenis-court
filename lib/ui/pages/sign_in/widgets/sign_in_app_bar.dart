import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tenis_court/app/infrastructure/sources/app_asset.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_state.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/utils/failure_util.dart';
import 'package:tenis_court/ui/utils/snackbar_util.dart';
import 'package:tenis_court/ui/widgets/custom_back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInAppBar extends StatelessWidget {
  const SignInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        context.loaderOverlay.hide();
        switch (state) {
          case SignInStateFailure():
            SnackbarUtil.showSnackbar(
              context,
              message: FailureUtil.map(context, state.failure),
              type: SnackbarType.error,
            );
          case SignInStateLoading():
            context.loaderOverlay.show();
          case SignInStateSuccess():
            SnackbarUtil.showSnackbar(
              context,
              message: AppLocalizations.of(context)!.successfully,
            );
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
