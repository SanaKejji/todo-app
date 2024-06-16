// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:todo_app/core/di/injection_module.dart' as _i26;
import 'package:todo_app/core/services/auth_storage_service.dart' as _i7;
import 'package:todo_app/core/unified_api/dio/dio_interceptor.dart' as _i6;
import 'package:todo_app/data/data_source/auth_data_source.dart' as _i8;
import 'package:todo_app/data/data_source/todos_data_source.dart' as _i9;
import 'package:todo_app/data/repositories/auth_repository_impl.dart' as _i19;
import 'package:todo_app/data/repositories/todos_repository_impl.dart' as _i11;
import 'package:todo_app/domain/repositories/auth_repositiory.dart' as _i18;
import 'package:todo_app/domain/repositories/todos_repository.dart' as _i10;
import 'package:todo_app/domain/use_cases/auth/get_current_use_case.dart'
    as _i21;
import 'package:todo_app/domain/use_cases/auth/login_use_case.dart' as _i22;
import 'package:todo_app/domain/use_cases/auth/refresh_token_use_case.dart'
    as _i23;
import 'package:todo_app/domain/use_cases/todos/add_todo_use_case.dart' as _i12;
import 'package:todo_app/domain/use_cases/todos/delete_todo_use_case.dart'
    as _i13;
import 'package:todo_app/domain/use_cases/todos/get_all_todos_use_case.dart'
    as _i14;
import 'package:todo_app/domain/use_cases/todos/get_user_todos_use_case.dart'
    as _i15;
import 'package:todo_app/domain/use_cases/todos/update_todo_use_case.dart'
    as _i16;
import 'package:todo_app/presentation/auth/bloc/auth_bloc.dart' as _i25;
import 'package:todo_app/presentation/base/bloc/base_cubit.dart' as _i24;
import 'package:todo_app/presentation/my_todos/bloc/my_todos_bloc.dart' as _i20;
import 'package:todo_app/presentation/others_todos/bloc/others_todos_bloc.dart'
    as _i17;
import 'package:todo_app/router/router.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i5.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i6.DioHeadersInterceptor>(
        () => _i6.DioHeadersInterceptor());
    gh.lazySingleton<_i7.AuthStorageService>(
        () => _i7.AuthStorageService(gh<_i3.SharedPreferences>()));
    gh.factory<_i8.AuthRemoteDataSource>(
        () => _i8.AuthRemoteDataSource(dio: gh<_i4.Dio>()));
    gh.factory<_i9.TodosRemoteDataSource>(
        () => _i9.TodosRemoteDataSource(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i10.TodosRepository>(
        () => _i11.TodosRepositoryImpl(gh<_i9.TodosRemoteDataSource>()));
    gh.lazySingleton<_i12.AddTodoUseCase>(
        () => _i12.AddTodoUseCase(gh<_i10.TodosRepository>()));
    gh.lazySingleton<_i13.DeleteTodoUseCase>(
        () => _i13.DeleteTodoUseCase(gh<_i10.TodosRepository>()));
    gh.lazySingleton<_i14.GetAllTodosUseCase>(
        () => _i14.GetAllTodosUseCase(gh<_i10.TodosRepository>()));
    gh.lazySingleton<_i15.GetUserTodosUseCase>(
        () => _i15.GetUserTodosUseCase(gh<_i10.TodosRepository>()));
    gh.lazySingleton<_i16.UpdateTodoUseCase>(
        () => _i16.UpdateTodoUseCase(gh<_i10.TodosRepository>()));
    gh.lazySingleton<_i17.OthersTodosBloc>(
        () => _i17.OthersTodosBloc(gh<_i14.GetAllTodosUseCase>()));
    gh.lazySingleton<_i18.AuthRepository>(
        () => _i19.AuthRepositoryImpl(gh<_i8.AuthRemoteDataSource>()));
    gh.lazySingleton<_i20.MyTodosBloc>(() => _i20.MyTodosBloc(
          gh<_i15.GetUserTodosUseCase>(),
          gh<_i12.AddTodoUseCase>(),
          gh<_i16.UpdateTodoUseCase>(),
          gh<_i13.DeleteTodoUseCase>(),
        ));
    gh.lazySingleton<_i21.GetCurrentUserUseCase>(
        () => _i21.GetCurrentUserUseCase(gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i22.LoginUseCase>(
        () => _i22.LoginUseCase(gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i23.RefreshTokenUseCase>(
        () => _i23.RefreshTokenUseCase(gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i24.BaseCubit>(
        () => _i24.BaseCubit(gh<_i21.GetCurrentUserUseCase>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(gh<_i22.LoginUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i26.InjectableModule {}
