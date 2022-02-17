import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappgetx/controller/Todo_Controller.dart';
import 'package:todoappgetx/ui/Completed_Page.dart';
import 'package:todoappgetx/ui/Details_Page.dart';
import 'package:todoappgetx/ui/NotCompleted_Page.dart';

class HomePage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (todoController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(NotCompletedPage());
                              },
                              icon: const Icon(Icons.timer, size: 18),
                              label: const Text("Todo"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(CompletedPage());
                              },
                              icon: const Icon(Icons.check, size: 18),
                              label: const Text("Done"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoController.todoList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(DetailsPage(
                                  todo: todoController.todoList[index],
                                ));
                              },
                              child: Card(
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          "ID: ${todoController.todoList[index].id}"),
                                      Text(
                                          "User ID: ${todoController.todoList[index].userId}"),
                                      Text(
                                          "Title: ${todoController.todoList[index].title}"),
                                      Obx(() => Checkbox(
                                            value: todoController
                                                .todoList[index].completed,
                                            onChanged: (newValue) {
                                              if (todoController.todoList[index]
                                                      .completed ==
                                                  false) {
                                                todoController.completedItem(
                                                    todoController
                                                        .todoList[index].id!);
                                                todoController.update();
                                              } else {
                                                todoController.notCompletedItem(
                                                    todoController
                                                        .todoList[index].id!);
                                                todoController.update();
                                              }
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
