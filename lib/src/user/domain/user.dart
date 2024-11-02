class User {
  const User({
    this.id = 0,
    this.code = '',
    required this.email,
    required this.names,
    this.phone,
    required this.password,
    this.accountNonLocked = true,
    this.accountNonExpired = true,
    this.credentialsNonExpired = true,
    this.enabled = true,
    required this.creationDate,
    required this.updateDate,
  });

  final int id;
  final String code;
  final String email;
  final String names;
  final String? phone;
  final String password;
  final bool accountNonLocked;
  final bool accountNonExpired;
  final bool credentialsNonExpired;
  final bool enabled;
  final DateTime creationDate;
  final DateTime updateDate;

  User copyWith({
    int? id,
    String? code,
    String? email,
    String? names,
    String? phone,
    String? password,
    bool? accountNonLocked,
    bool? accountNonExpired,
    bool? credentialsNonExpired,
    bool? enabled,
    DateTime? creationDate,
    DateTime? updateDate,
  }) {
    return User(
      id: id ?? this.id,
      code: code ?? this.code,
      email: email ?? this.email,
      names: names ?? this.names,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      accountNonLocked: accountNonLocked ?? this.accountNonLocked,
      accountNonExpired: accountNonExpired ?? this.accountNonExpired,
      credentialsNonExpired: credentialsNonExpired ?? this.credentialsNonExpired,
      enabled: enabled ?? this.enabled,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
    );
  }
}
