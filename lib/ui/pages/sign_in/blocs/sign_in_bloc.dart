import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tenis_court/app/domain/failure.dart';
import 'package:tenis_court/src/user/application/user_service.dart';
import 'package:tenis_court/src/user/domain/user.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_event.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_state.dart';
import 'package:tenis_court/ui/utils/util.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.userService,
  }) : super(const SignInStateInitial()) {
    log('SignInBloc created', name: 'SignInBloc');
    on<SignInEventRememberMeToggled>(_onSignInEventRememberMeToggled);
    on<SignInEventSubmit>(_onSignInEventSubmit);
  }

  final UserService userService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    log('SignInBloc closed', name: 'SignInBloc');
    return super.close();
  }

  void _onSignInEventRememberMeToggled(
    SignInEventRememberMeToggled event,
    Emitter<SignInState> emit,
  ) {
    emit(
      SignInStateInitial(rememberMe: event.rememberMe),
    );
  }

  Future<void> _onSignInEventSubmit(
    SignInEventSubmit event,
    Emitter<SignInState> emit,
  ) async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
    emit(SignInStateLoading(rememberMe: state.rememberMe));
    final Either<Failure, User> response =
        await userService.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    response.fold(
      (l) {
        emit(SignInStateFailure(failure: l, rememberMe: state.rememberMe));
      },
      (r) {
        emit(const SignInStateSuccess());
      },
    );
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
}
