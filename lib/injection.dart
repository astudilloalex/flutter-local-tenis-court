import 'package:get_it/get_it.dart';
import 'package:tenis_court/app/infrastructure/sources/sqlite.dart';
import 'package:tenis_court/src/user/application/user_service.dart';
import 'package:tenis_court/src/user/domain/i_user_repository.dart';
import 'package:tenis_court/src/user/infrastructure/sqlite_user_repository.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  const Injection._();

  static Future<void> init() async {
    getIt.registerLazySingletonAsync<SQLite>(
      () => SQLite.instance,
    );
    await getIt.isReady<SQLite>();
    // Register repositories
    getIt.registerLazySingleton<IUserRepository>(
      () => SQLiteUserRepository(getIt<SQLite>()),
    );

    // Register services
    getIt.registerFactory<UserService>(
      () => UserService(getIt<IUserRepository>()),
    );
  }
}
