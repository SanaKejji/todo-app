import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/use_case/use_case.dart';
import 'package:todo_app/domain/use_cases/auth/get_current_use_case.dart';

import '../../../data/models/auth/user.dart';
import '../../../router/router.gr.dart';

part 'base_state.dart';

@lazySingleton
class BaseCubit extends Cubit<BaseState> {
  BaseCubit(this._getCurrentUserUseCase) : super(const BaseState());
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  void logout(BuildContext context) {
    getIt<SharedPreferences>().clear();
    context.router.navigate(const BaseRoute());
  }

  Future<void> getUserMainInfo() async {
    final result = await _getCurrentUserUseCase(NoParams());
    result.fold((ifLeft) {}, (user) {
      emit(state.copyWith(userData: user));
    });
  }
}
