import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todoappgetx/controller/Todo_Controller.dart';
import 'Details_Page.dart';

class NotCompletedPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  NotCompletedPage({Key? key}) : super(key: key);

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
                    Obx(() => Text(
                          'Todo Task Count: ${todoController.notCompletedListsItems.length}',
                          style: const TextStyle(
                              fontSize: 28, color: Colors.black),
                        )),
                    Obx(() {
                      if (todoController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                todoController.notCompletedListsItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(DetailsPage(
                                      todo: todoController
                                          .notCompletedListsItems[index],
                                    ));
                                  },
                                  child: Card(
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              "ID: ${todoController.notCompletedListsItems[index].id}"),
                                          Text(
                                              "User ID: ${todoController.notCompletedListsItems[index].userId}"),
                                          Text(
                                              "Title: ${todoController.notCompletedListsItems[index].title}"),
                                          Checkbox(
                                            value: todoController
                                                .notCompletedListsItems[index]
                                                .completed,
                                            onChanged: null,
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
