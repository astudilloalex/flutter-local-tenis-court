import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props {
    return [];
  }
}

class SignInEventRememberMeToggled extends SignInEvent {
  const SignInEventRememberMeToggled({
    required this.rememberMe,
  });

  final bool rememberMe;

  @override
  List<Object?> get props {
    return [
      rememberMe,
    ];
  }
}
