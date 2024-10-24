import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tenis_court/injection.dart';
import 'package:tenis_court/ui/routes/route_page.dart';
import 'package:tenis_court/ui/theme/app_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(
    const MyApp(
      routePage: RoutePage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.routePage,
  });

  final RoutePage routePage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: routePage.router,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeData.light,
    );
  }
}
