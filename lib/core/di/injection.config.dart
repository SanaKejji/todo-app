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
import 'package:todo_app/core/services/auth_storage_service.dart' as _i8;
import 'package:todo_app/core/unified_api/dio/dio_interceptor.dart' as _i6;
import 'package:todo_app/data/data_source/auth_data_source.dart' as _i9;
import 'package:todo_app/data/data_source/todos_data_source.dart' as _i10;
import 'package:todo_app/data/repositories/auth_repository_impl.dart' as _i20;
import 'package:todo_app/data/repositories/todos_repository_impl.dart' as _i12;
import 'package:todo_app/domain/repositories/auth_repositiory.dart' as _i19;
import 'package:todo_app/domain/repositories/todos_repository.dart' as _i11;
import 'package:todo_app/domain/use_cases/auth/get_current_use_case.dart'
    as _i22;
import 'package:todo_app/domain/use_cases/auth/login_use_case.dart' as _i23;
import 'package:todo_app/domain/use_cases/auth/refresh_token_use_case.dart'
    as _i24;
import 'package:todo_app/domain/use_cases/todos/add_todo_use_case.dart' as _i13;
import 'package:todo_app/domain/use_cases/todos/delete_todo_use_case.dart'
    as _i14;
import 'package:todo_app/domain/use_cases/todos/get_all_todos_use_case.dart'
    as _i15;
import 'package:todo_app/domain/use_cases/todos/get_user_todos_use_case.dart'
    as _i16;
import 'package:todo_app/domain/use_cases/todos/update_todo_use_case.dart'
    as _i17;
import 'package:todo_app/presentation/auth/bloc/auth_bloc.dart' as _i25;
import 'package:todo_app/presentation/base/bloc/base_cubit.dart' as _i7;
import 'package:todo_app/presentation/my_todos/bloc/my_todos_bloc.dart' as _i21;
import 'package:todo_app/presentation/others_todos/bloc/others_todos_bloc.dart'
    as _i18;
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
    gh.lazySingleton<_i7.BaseCubit>(() => _i7.BaseCubit());
    gh.lazySingleton<_i8.AuthStorageService>(
        () => _i8.AuthStorageService(gh<_i3.SharedPreferences>()));
    gh.factory<_i9.AuthRemoteDataSource>(
        () => _i9.AuthRemoteDataSource(dio: gh<_i4.Dio>()));
    gh.factory<_i10.TodosRemoteDataSource>(
        () => _i10.TodosRemoteDataSource(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i11.TodosRepository>(
        () => _i12.TodosRepositoryImpl(gh<_i10.TodosRemoteDataSource>()));
    gh.lazySingleton<_i13.AddTodoUseCase>(
        () => _i13.AddTodoUseCase(gh<_i11.TodosRepository>()));
    gh.lazySingleton<_i14.DeleteTodoUseCase>(
        () => _i14.DeleteTodoUseCase(gh<_i11.TodosRepository>()));
    gh.lazySingleton<_i15.GetAllTodosUseCase>(
        () => _i15.GetAllTodosUseCase(gh<_i11.TodosRepository>()));
    gh.lazySingleton<_i16.GetUserTodosUseCase>(
        () => _i16.GetUserTodosUseCase(gh<_i11.TodosRepository>()));
    gh.lazySingleton<_i17.UpdateTodoUseCase>(
        () => _i17.UpdateTodoUseCase(gh<_i11.TodosRepository>()));
    gh.lazySingleton<_i18.OthersTodosBloc>(
        () => _i18.OthersTodosBloc(gh<_i15.GetAllTodosUseCase>()));
    gh.lazySingleton<_i19.AuthRepository>(
        () => _i20.AuthRepositoryImpl(gh<_i9.AuthRemoteDataSource>()));
    gh.lazySingleton<_i21.MyTodosBloc>(() => _i21.MyTodosBloc(
          gh<_i16.GetUserTodosUseCase>(),
          gh<_i13.AddTodoUseCase>(),
          gh<_i17.UpdateTodoUseCase>(),
          gh<_i14.DeleteTodoUseCase>(),
        ));
    gh.lazySingleton<_i22.GetCurrentUserUseCase>(
        () => _i22.GetCurrentUserUseCase(gh<_i19.AuthRepository>()));
    gh.lazySingleton<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(gh<_i19.AuthRepository>()));
    gh.lazySingleton<_i24.RefreshTokenUseCase>(
        () => _i24.RefreshTokenUseCase(gh<_i19.AuthRepository>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(gh<_i23.LoginUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i26.InjectableModule {}
