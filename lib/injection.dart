import 'package:get_it/get_it.dart';
import 'package:tenis_court/app/infrastructure/sources/sqlite.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  const Injection._();

  static Future<void> init() async {
    getIt.registerLazySingletonAsync<SQLite>(
      () => SQLite.instance,
    );
    await getIt.isReady<SQLite>();
  }
}
