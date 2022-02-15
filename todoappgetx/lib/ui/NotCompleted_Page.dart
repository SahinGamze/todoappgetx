import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todoappgetx/controller/Todo_Controller.dart';
import '../model/Todo.dart';
import 'Details_Page.dart';

class NotCompletedPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

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
              if (todoController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.timer, size: 18),
                              label: Text("Todo"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.check, size: 18),
                              label: Text("Done"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      if (todoController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: todoController.todoList
                                .where((p0) => p0.completed == false)
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(DetailsPage(
                                      todo: todoController.todoList[index],
                                    ));
                                  },
                                  child: Card(
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              "ID: ${todoController.todoList[index].id}"),
                                          Text(
                                              "User ID: ${todoController.todoList[index].userId}"),
                                          Text(
                                              "Title: ${todoController.todoList[index].title}"),
                                          Checkbox(
                                            value: todoController
                                                .todoList[index].completed,
                                            onChanged: (newValue) {
                                              Get.to(DetailsPage(
                                                todo: todoController
                                                    .todoList[index],
                                              ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    })
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
