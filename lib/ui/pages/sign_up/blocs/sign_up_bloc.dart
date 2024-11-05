import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tenis_court/app/domain/failure.dart';
import 'package:tenis_court/src/user/application/user_service.dart';
import 'package:tenis_court/src/user/domain/user.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_event.dart';
import 'package:tenis_court/ui/pages/sign_up/blocs/sign_up_state.dart';
import 'package:tenis_court/ui/utils/util.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required this.userService,
  }) : super(const SignUpStateInitial()) {
    log('SignUpBloc created', name: 'SignUpBloc');
    on<SignUpEventSubmit>(_onSignUpEventSubmit);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final UserService userService;

  @override
  Future<void> close() {
    namesController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    log('SignUpBloc closed', name: 'SignUpBloc');
    return super.close();
  }

  Future<void> _onSignUpEventSubmit(
    SignUpEventSubmit event,
    Emitter<SignUpState> emit,
  ) async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
    emit(const SignUpStateLoading());
    final Either<Failure, User> response = await userService.create(
      User(
        email: emailController.text.trim(),
        names: namesController.text.trim(),
        password: passwordController.text.trim(),
        creationDate: DateTime.now(),
        updateDate: DateTime.now(),
      ),
    );
    response.fold(
      (l) {
        emit(SignUpStateFailure(failure: l));
      },
      (r) {
        emit(const SignUpStateSuccess());
      },
    );
  }

  String? validateNames(String? value) {
    if (value == null || value.trim().length < 2) {
      return 'invalid-names';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || !Util.isValidEmail(value.trim())) {
      return 'invalid-email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || !Util.isSecurePassword(value.trim())) {
      return 'weak-password';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (!Util.isValidPhoneNumber(value.trim())) {
      return 'invalid-phone-number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      return 'passwords-do-not-match';
    }
    return null;
  }
}
