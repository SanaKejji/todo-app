import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/services/auth_storage_service.dart';
import 'package:todo_app/core/utils/bot_toast_utils.dart';
import 'package:todo_app/core/widgets/component_template.dart';
import 'package:todo_app/domain/use_cases/auth/login_use_case.dart';
import 'package:todo_app/presentation/auth/bloc/auth_event.dart';
import 'package:todo_app/presentation/auth/bloc/auth_state.dart';

import '../../../router/router.gr.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  AuthBloc(this._loginUseCase) : super(AuthState()) {
    on<LoggedInEvent>(_onLoggedIn);
  }

  final form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });
  _onLoggedIn(LoggedInEvent event, Emitter<AuthState> emit) async {
    showLoading();
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }
    final result = await _loginUseCase(LoginParam(
        username: form.control('username').value,
        password: form.control('password').value,
        expiresInMins: 5));
    result.fold((l) {
      showErrorToast(l.message);
    }, (info) async {
      await getIt<AuthStorageService>().setLoginInfo(info);
      closeLoading();
      event.context.router.push(const MyTodosRoute());
    });
    closeLoading();
  }
}
