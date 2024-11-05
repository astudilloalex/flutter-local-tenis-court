import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tenis_court/injection.dart';
import 'package:tenis_court/ui/routes/route_page.dart';
import 'package:tenis_court/ui/theme/app_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(
    MyApp(
      router: const RoutePage().router,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.router,
  });

  final GoRouter router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: router,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppThemeData.light,
      ),
    );
  }
}
