import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    required this.code,
    this.message,
  });

  final String code;
  final String? message;

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      code,
      message,
    ];
  }
}
