import 'dart:convert';

import 'package:http/http.dart';
import 'package:todoappgetx/model/Todo.dart';
import 'package:todoappgetx/data/Todo_Service.dart';

class TodoRepository {
  final TodoService todoService;

  TodoRepository({required this.todoService});

  static Future<List<Todo>> getTodosFromTodoModel() async {
    Response response = await TodoService.getTodos();
    Iterable jsonlist = json.decode(response.body);
    List<Todo> todosList =
        jsonlist.map((model) => Todo.fromJson(model)).toList();
    return todosList;
  }
}
