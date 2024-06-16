import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/data/models/todo/todo.dart';

import '../../data/models/auth/login_info.dart';

@LazySingleton()
class TodosStorageService {
  static const String _todos = "todos";

  final SharedPreferences _sharedPreferences;

  TodosStorageService(this._sharedPreferences);

  Future<void> setTodos(List<Todo> todos) async {
    await _sharedPreferences.setString(
        _todos, json.encode(todos.map((e) => e.toJson()).toList()));
  }

  List<Todo>? getTodos() {
    final todos = _sharedPreferences.getString(_todos);
    if (todos == null) {
      return null;
    }
    return (json.decode(todos) as List<dynamic>)
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
