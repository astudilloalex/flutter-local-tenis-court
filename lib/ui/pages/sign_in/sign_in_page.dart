import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tenis_court/ui/routes/route_name.dart';
import 'package:tenis_court/ui/widgets/custom_back_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150.0,
        leading: CustomBackButton(
          onTap: () {
            context.go(RouteName.welcome);
          },
        ),
      ),
    );
  }
}
