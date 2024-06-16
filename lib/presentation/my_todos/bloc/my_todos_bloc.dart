import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/services/auth_storage_service.dart';
import 'package:todo_app/core/services/todos_storage_service.dart';
import 'package:todo_app/core/use_case/use_case.dart';
import 'package:todo_app/core/utils/bot_toast_utils.dart';
import 'package:todo_app/core/widgets/component_template.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:todo_app/core/widgets/confirmation_dialog.dart';
import 'package:todo_app/core/widgets/show_dialog.dart';
import 'package:todo_app/domain/use_cases/todos/add_todo_use_case.dart';
import 'package:todo_app/domain/use_cases/todos/delete_todo_use_case.dart';
import 'package:todo_app/domain/use_cases/todos/get_user_todos_use_case.dart';
import 'package:todo_app/domain/use_cases/todos/update_todo_use_case.dart';

import '../add_todo_dialog.dart';
import 'my_todos_event.dart';
import 'my_todos_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@LazySingleton()
class MyTodosBloc extends Bloc<MyTodosEvent, MyTodosState> {
  final GetUserTodosUseCase _getUserTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  MyTodosBloc(this._getUserTodosUseCase, this._addTodoUseCase, this._updateTodoUseCase,
      this._deleteTodoUseCase)
      : super(const MyTodosState()) {
    on<MyTodosFetchedEvent>(_onMyTodosFetchedEvent,
        transformer: throttleDroppable(throttleDuration));
    on<UpdatedTodoEvent>(_onUpdateTodo);
    on<DeletedTodoEvent>(_onDeleteTodo);
    on<AddedTodoEvent>(_onAddTodo);
  }
  final _todosStorage = getIt<TodosStorageService>();
  Future<void> _onMyTodosFetchedEvent(MyTodosFetchedEvent event, Emitter<MyTodosState> emit) async {
    final localTodos = _todosStorage.getTodos() ?? [];
    if (localTodos.isNotEmpty) {
      emit(state.copyWith(
          todos: List.of(localTodos),
          screenStatus:
              localTodos.isNotEmpty ? ComponentStatus.showData : ComponentStatus.emptyData));
      return;
    }
    emit(state.copyWith(
        screenStatus: event.withLoading ? ComponentStatus.fetchingData : ComponentStatus.showData));
    final result = await _getUserTodosUseCase(NoParams());
    result.fold((error) {
      emit(state.copyWith(errorMessage: error.message, screenStatus: ComponentStatus.error));
    }, (res) {
      emit(state.copyWith(
          todos: List.of(res.todos),
          screenStatus:
              res.todos.isNotEmpty ? ComponentStatus.showData : ComponentStatus.emptyData));
      _todosStorage.setTodos(res.todos);
    });
  }

  Future<void> _onAddTodo(AddedTodoEvent event, Emitter<MyTodosState> emit) async {
    showLoading();
    final result = await _addTodoUseCase(TodoParams(
        userId: getIt<AuthStorageService>().userId ?? 0, todo: event.todo, completed: false));
    result.fold((error) {
      showErrorToast(error.message);
    }, (res) async {
      showSuccessToast('Successfully Added');
      await _todosStorage.setTodos(List.of(state.todos)..add(res));
      add(MyTodosFetchedEvent(withLoading: false));
    });
    closeLoading();
  }

  Future<void> _onDeleteTodo(DeletedTodoEvent event, Emitter<MyTodosState> emit) async {
    final confirm = await showAppDialog(event.context,
        page: ConfirmationDialog(
            title: 'Delete task',
            confirmationMessage: 'Are you sure you want to delete this task?')) as bool?;
    if (!(confirm ?? false)) {
      return;
    }
    showLoading();
    final result = await _deleteTodoUseCase(state.todos[event.index].id);
    result.fold((error) {
      showErrorToast(error.message);
    }, (res) async {
      showSuccessToast('Successfully Deleted');
      await _todosStorage.setTodos(List.of(state.todos)..removeAt(event.index));
      add(MyTodosFetchedEvent(withLoading: false));
    });
    closeLoading();
  }

  Future<void> _onUpdateTodo(UpdatedTodoEvent event, Emitter<MyTodosState> emit) async {
    final confirm = await showAppDialog(event.context,
        page: ConfirmationDialog(
            title: event.completed ? 'Un Complete Task' : 'Complete task',
            confirmationMessage: event.completed
                ? 'Are you sure you want to un complete this task?'
                : 'Are you sure you want to un complete this task?')) as bool?;
    if (!(confirm ?? false)) {
      return;
    }
    showLoading();
    final result = await _updateTodoUseCase(
        UpdateTodoParams(todoId: state.todos[event.index].id, completed: !event.completed));

    result.fold((error) {
      showErrorToast(error.message);
    }, (res) async {
      showSuccessToast('Successfully Updated');
      await _todosStorage.setTodos(List.of(state.todos)..[event.index] = res);
      add(MyTodosFetchedEvent(withLoading: false));
    });
    closeLoading();
  }

  void openAddTodoDialog(BuildContext context) {
    showAppDialog(context, page: AddTodoDialog(
      onClickAdd: (todo) {
        add(AddedTodoEvent(todo: todo));
      },
    ));
  }
}
