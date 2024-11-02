import 'package:tenis_court/app/domain/enums/table_enum.dart';
import 'package:tenis_court/app/infrastructure/sources/sqlite.dart';
import 'package:tenis_court/src/user/domain/i_user_repository.dart';
import 'package:tenis_court/src/user/domain/user.dart';
import 'package:tenis_court/src/user/infrastructure/user_mapper.dart';

class SQLiteUserRepository implements IUserRepository {
  const SQLiteUserRepository(this._sqlite);

  final SQLite _sqlite;

  @override
  Future<User?> findByEmail(String email) async {
    final List<Map<String, Object?>> query = await _sqlite.db.query(
      TableEnum.user.name,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email],
      orderBy: 'id DESC',
    );
    if (query.isEmpty) return null;
    return UserMapper.fromSQLite(query.first);
  }

  @override
  Future<User> save(User user) async {
    final int id = await _sqlite.db.insert(
      TableEnum.user.name,
      UserMapper.toSQLite(user),
    );
    return user.copyWith(id: id);
  }
}
