import 'package:equatable/equatable.dart';
import 'package:tenis_court/app/domain/failure.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props {
    return [];
  }
}

class SignUpStateInitial extends SignUpState {
  const SignUpStateInitial();

  @override
  List<Object?> get props {
    return [];
  }
}

class SignUpStateLoading extends SignUpState {
  const SignUpStateLoading();

  @override
  List<Object?> get props {
    return [];
  }
}

class SignUpStateFailure extends SignUpState {
  const SignUpStateFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props {
    return [
      failure,
    ];
  }
}

class SignUpStateSuccess extends SignUpState {
  const SignUpStateSuccess();

  @override
  List<Object?> get props {
    return [];
  }
}
