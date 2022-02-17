import 'package:get/state_manager.dart';
import 'package:todoappgetx/model/Todo.dart';
import 'package:todoappgetx/data/Todo_Repository.dart';

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
      final List<Todo> todos = await TodoRepository.getTodosFromTodoModel();
      todoList.value = todos.obs;
    } finally {
      isLoading(false);
    }
  }

  List<Todo> get completedListsItems {
    return todoList.where((item) => item.completed == true).toList();
  }

  List<Todo> get notCompletedListsItems {
    return todoList.where((item) => item.completed == false).toList();
  }

  void completedItem(int id) {
    final int index = todoList.indexWhere((item) => item.id == id);
    todoList[index].completed = true;
  }

  void notCompletedItem(int id) {
    final int index = todoList.indexWhere((item) => item.id == id);
    todoList[index].completed = false;
  }
}
