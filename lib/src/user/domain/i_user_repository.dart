import 'package:tenis_court/src/user/domain/user.dart';

abstract class IUserRepository {
  const IUserRepository();

  Future<User> save(User user);

  Future<User?> findByEmail(String email);
}
