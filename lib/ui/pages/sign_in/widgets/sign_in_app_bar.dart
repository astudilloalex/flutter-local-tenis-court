import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tenis_court/app/infrastructure/sources/app_asset.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/widgets/custom_back_button.dart';

class SignInAppBar extends StatelessWidget {
  const SignInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}
