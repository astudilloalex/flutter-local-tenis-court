import 'package:go_router/go_router.dart';
import 'package:tenis_court/ui/pages/welcome/welcome_page.dart';
import 'package:tenis_court/ui/routes/route_name.dart';

class RoutePage {
  const RoutePage();

  GoRouter get router {
    return GoRouter(
      initialLocation: RouteName.welcome,
      routes: [
        GoRoute(
          path: RouteName.welcome,
          builder: (context, state) => const WelcomePage(),
        ),
      ],
    );
  }
}
