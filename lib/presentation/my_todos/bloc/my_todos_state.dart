import 'package:equatable/equatable.dart';
import 'package:todo_app/data/models/todo/todo.dart';

import '../../../core/widgets/component_template.dart';

class MyTodosState extends Equatable {
  const MyTodosState({
    this.screenStatus = ComponentStatus.showData,
    this.todos = const <Todo>[],
    this.errorMessage = '',
  });

  final ComponentStatus screenStatus;
  final String errorMessage;
  final List<Todo> todos;

  @override
  List<Object?> get props => [screenStatus, todos, errorMessage];

  MyTodosState copyWith({
    ComponentStatus? screenStatus,
    String? errorMessage,
    List<Todo>? todos,
  }) {
    return MyTodosState(
      screenStatus: screenStatus ?? this.screenStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      todos: todos ?? this.todos,
    );
  }
}
