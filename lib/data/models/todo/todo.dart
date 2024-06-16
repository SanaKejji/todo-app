import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final int id;
  final int userId;
  final bool completed;
  final String todo;

  Todo(
      {required this.id,
      required this.userId,
      required this.completed,
      required this.todo});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedTodoModel {
  final List<Todo> todos;
  final int total;
  final int limit;
  final int skip;

  PaginatedTodoModel(
      {required this.todos,
      required this.limit,
      required this.skip,
      required this.total});

  factory PaginatedTodoModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedTodoModelToJson(this);
}
