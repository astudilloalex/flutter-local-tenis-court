import 'package:tenis_court/src/user/domain/user.dart';

class UserMapper {
  const UserMapper._();

  static User fromSQLite(Map<String, Object?> map) {
    return User(
      creationDate: DateTime.parse(map['creation_date'].toString()),
      email: map['email']! as String,
      names: map['names']! as String,
      password: map['password']! as String,
      updateDate: DateTime.parse(map['update_date'].toString()),
      accountNonExpired: map['account_non_expired'] == 1,
      accountNonLocked: map['account_non_locked'] == 1,
      code: map['code']! as String,
      credentialsNonExpired: map['credentials_non_expired'] == 1,
      enabled: map['enabled'] == 1,
      id: map['id']! as int,
      phone: map['phone'] as String?,
    );
  }

  static Map<String, Object?> toSQLite(User user) {
    return {
      'code': user.code,
      'email': user.email,
      'names': user.names,
      'phone': user.phone,
      'password': user.password,
      'account_non_locked': user.accountNonLocked ? 1 : 0,
      'account_non_expired': user.accountNonExpired ? 1 : 0,
      'credentials_non_expired': user.credentialsNonExpired ? 1 : 0,
      'enabled': user.enabled ? 1 : 0,
      'creation_date': user.creationDate.toIso8601String(),
      'update_date': user.updateDate.toIso8601String(),
    };
  }
}
