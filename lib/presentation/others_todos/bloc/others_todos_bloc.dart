import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/utils/bot_toast_utils.dart';
import 'package:todo_app/core/widgets/component_template.dart';

import 'package:todo_app/domain/use_cases/todos/get_all_todos_use_case.dart';
import 'package:todo_app/presentation/others_todos/bloc/others_todos_state.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'others_todos_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const int _limit = 20;

@LazySingleton()
class OthersTodosBloc extends Bloc<OthersTodosEvent, OthersTodosState> {
  final GetAllTodosUseCase _getAllTodosUseCase;

  OthersTodosBloc(this._getAllTodosUseCase) : super(const OthersTodosState()) {
    on<TodosFetchedInitialPageEvent>(_onTodosFetchedInitialPageEvent,
        transformer: throttleDroppable(throttleDuration));
    on<TodosFetchedNextPageEvent>(_onTodosFetchedNextPageEventEvent,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onTodosFetchedInitialPageEvent(
      TodosFetchedInitialPageEvent event,
      Emitter<OthersTodosState> emit) async {
    emit(state.copyWith(
        screenStatus: ComponentStatus.fetchingData, hasReachedMax: false));
    final result =
        await _getAllTodosUseCase(PaginationParam(limit: _limit, skip: 0));
    result.fold((error) {
      emit(state.copyWith(
          errorMessage: error.message, screenStatus: ComponentStatus.error));
    }, (res) {
      emit(state.copyWith(
          todos: List.of(res.todos),
          hasReachedMax: _limit == res.todos.length ? false : true,
          screenStatus: res.todos.isNotEmpty
              ? ComponentStatus.showData
              : ComponentStatus.emptyData));
    });
  }

  Future<void> _onTodosFetchedNextPageEventEvent(
      TodosFetchedNextPageEvent event, Emitter<OthersTodosState> emit) async {
    if (state.hasReachedMax) return;
    final result = await _getAllTodosUseCase(
        PaginationParam(limit: _limit, skip: state.todos.length));
    result.fold((error) {
      showErrorToast(error.message);
      emit(state.copyWith(screenStatus: ComponentStatus.showData));
    }, (res) {
      emit(state.copyWith(
          hasReachedMax: res.todos.isEmpty ? true : false,
          screenStatus: ComponentStatus.showData,
          todos: List.of(state.todos)..addAll(res.todos)));
    });
  }
}
