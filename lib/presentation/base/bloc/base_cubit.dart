import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/di/injection.dart';

import '../../../router/router.gr.dart';

part 'base_state.dart';

@lazySingleton
class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState());

  void logout(BuildContext context) {
    getIt<SharedPreferences>().clear();
    context.router.navigate(const BaseRoute());
  }
}
