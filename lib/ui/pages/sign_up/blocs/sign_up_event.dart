import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props {
    return [];
  }
}

class SignUpEventSubmit extends SignUpEvent {
  const SignUpEventSubmit();

  @override
  List<Object?> get props {
    return [];
  }
}
