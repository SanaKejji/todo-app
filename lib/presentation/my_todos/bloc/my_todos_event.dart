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
  final int id;
  final bool completed;

  UpdatedTodoEvent(this.completed, {required this.id});
}

class DeletedTodoEvent extends MyTodosEvent {
  final int id;

  DeletedTodoEvent({required this.id});
}
