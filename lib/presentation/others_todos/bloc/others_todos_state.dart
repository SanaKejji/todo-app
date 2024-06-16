import 'package:equatable/equatable.dart';
import 'package:todo_app/data/models/todo/todo.dart';

import '../../../core/widgets/component_template.dart';

class OthersTodosState extends Equatable {
  const OthersTodosState({
    this.screenStatus = ComponentStatus.showData,
    this.todos = const <Todo>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  final ComponentStatus screenStatus;
  final bool hasReachedMax;
  final String errorMessage;
  final List<Todo> todos;

  @override
  List<Object?> get props => [screenStatus, todos, hasReachedMax, errorMessage];

  OthersTodosState copyWith({
    ComponentStatus? screenStatus,
    bool? hasReachedMax,
    String? errorMessage,
    List<Todo>? todos,
  }) {
    return OthersTodosState(
      screenStatus: screenStatus ?? this.screenStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      todos: todos ?? this.todos,
    );
  }
}
