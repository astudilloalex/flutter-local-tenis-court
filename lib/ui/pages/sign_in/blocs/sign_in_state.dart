import 'package:equatable/equatable.dart';
import 'package:tenis_court/app/domain/failure.dart';

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

class SignInStateLoading extends SignInState {
  const SignInStateLoading({super.rememberMe});

  @override
  SignInStateLoading copyWith({
    bool? rememberMe,
  }) {
    return SignInStateLoading(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props {
    return [
      rememberMe,
    ];
  }
}

class SignInStateFailure extends SignInState {
  const SignInStateFailure({
    super.rememberMe,
    required this.failure,
  });

  final Failure failure;

  @override
  SignInStateFailure copyWith({
    bool? rememberMe,
    Failure? failure,
  }) {
    return SignInStateFailure(
      rememberMe: rememberMe ?? this.rememberMe,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props {
    return [
      rememberMe,
      failure,
    ];
  }
}

class SignInStateSuccess extends SignInState {
  const SignInStateSuccess({super.rememberMe});

  @override
  SignInStateSuccess copyWith({
    bool? rememberMe,
  }) {
    return SignInStateSuccess(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props {
    return [
      rememberMe,
    ];
  }
}
