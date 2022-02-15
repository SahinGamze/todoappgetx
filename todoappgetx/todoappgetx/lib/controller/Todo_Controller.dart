import 'package:get/state_manager.dart';
import 'package:todoappgetx/model/Todo.dart';
import 'package:todoappgetx/data/Todo_Repository.dart';

import '../variables.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  var todoList = <Todo>[].obs;

  @override
  void onInit() {
    getTodosFromTodoModel();
    super.onInit();
  }

  void getTodosFromTodoModel() async {
    try {
      isLoading(true);
      final List<Todo> todos = await Todo_Repository.getTodosFromTodoModel();
      if (todos != null) {
        todoList.value = todos;
      }
    } finally {
      isLoading(false);
    }
  }

  void getCompletedTodos() async {
    try {
      isLoading(true);
      final List<Todo> todos = await Todo_Repository.getTodosFromTodoModel();
      if (todos != null) {
        todoList.value =
            todos.where((element) => element.completed == true).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  void getNotCompletedTodos() async {
    try {
      isLoading(true);
      final List<Todo> todos = await Todo_Repository.getTodosFromTodoModel();
      if (todos != null) {
        todoList.value =
            todos.where((element) => element.completed == false).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
