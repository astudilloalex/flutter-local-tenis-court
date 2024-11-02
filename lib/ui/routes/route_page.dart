import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tenis_court/injection.dart';
import 'package:tenis_court/src/user/application/user_service.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:tenis_court/ui/pages/sign_in/sign_in_page.dart';
import 'package:tenis_court/ui/pages/welcome/welcome_page.dart';
import 'package:tenis_court/ui/routes/route_name.dart';

class RoutePage {
  const RoutePage();

  GoRouter get router {
    return GoRouter(
      initialLocation: RouteName.welcome,
      routes: [
        GoRoute(
          path: RouteName.signIn,
          builder: (context, state) => BlocProvider(
            create: (context) => SignInBloc(
              userService: getIt<UserService>(),
            ),
            child: const SignInPage(),
          ),
        ),
        GoRoute(
          path: RouteName.welcome,
          builder: (context, state) => const WelcomePage(),
        ),
      ],
    );
  }
}
