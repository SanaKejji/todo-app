// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      completed: json['completed'] as bool,
      todo: json['todo'] as String,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'completed': instance.completed,
      'todo': instance.todo,
    };

PaginatedTodoModel _$PaginatedTodoModelFromJson(Map<String, dynamic> json) =>
    PaginatedTodoModel(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedTodoModelToJson(PaginatedTodoModel instance) =>
    <String, dynamic>{
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'limit': instance.limit,
      'skip': instance.skip,
    };
