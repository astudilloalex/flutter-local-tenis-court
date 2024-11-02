import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenis_court/src/user/application/user_service.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_event.dart';
import 'package:tenis_court/ui/pages/sign_in/blocs/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.userService,
  }) : super(const SignInStateInitial()) {
    log('SignInBloc created', name: 'SignInBloc');
    on<SignInEventRememberMeToggled>(_onSignInEventRememberMeToggled);
  }

  final UserService userService;

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
      state.copyWith(
        rememberMe: event.rememberMe,
      ),
    );
  }
}
