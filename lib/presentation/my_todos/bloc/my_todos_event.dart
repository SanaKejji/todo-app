import 'package:flutter/cupertino.dart';

abstract class MyTodosEvent {}

class MyTodosFetchedEvent extends MyTodosEvent {
  final bool withLoading;

  MyTodosFetchedEvent({this.withLoading = true});
}

class AddedTodoEvent extends MyTodosEvent {
  final String todo;

  AddedTodoEvent({required this.todo});
}

class UpdatedTodoEvent extends MyTodosEvent {
  final int index;
  final bool completed;
  final BuildContext context;

  UpdatedTodoEvent({
    required this.index,
    required this.completed,
    required this.context,
  });
}

class DeletedTodoEvent extends MyTodosEvent {
  final int index;
  final BuildContext context;
  DeletedTodoEvent({required this.index, required this.context});
}
