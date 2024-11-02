import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState({
    this.rememberMe = false,
  });

  final bool rememberMe;

  @override
  List<Object?> get props {
    return [
      rememberMe,
    ];
  }

  SignInState copyWith({
    bool? rememberMe,
  });
}

class SignInStateInitial extends SignInState {
  const SignInStateInitial({super.rememberMe});

  @override
  List<Object?> get props {
    return [
      rememberMe,
    ];
  }

  @override
  SignInStateInitial copyWith({
    bool? rememberMe,
  }) {
    return SignInStateInitial(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
