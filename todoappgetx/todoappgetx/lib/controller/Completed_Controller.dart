import 'package:get/state_manager.dart';
import 'package:todoappgetx/model/Todo.dart';
import 'package:todoappgetx/data/Todo_Repository.dart';

class CompletedController extends GetxController {
  var isLoading = true.obs;
  var todoList = <Todo>[].obs;

  @override
  void onInit() {
    getCompletedTodos();
    super.onInit();
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
}
