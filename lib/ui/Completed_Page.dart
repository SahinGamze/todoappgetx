import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todoappgetx/controller/Todo_Controller.dart';
import 'package:todoappgetx/ui/Details_Page.dart';

class CompletedPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  CompletedPage({Key? key}) : super(key: key);

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
                          'Done Task Count: ${todoController.completedListsItems.length}',
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
                                todoController.completedListsItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(DetailsPage(
                                      todo: todoController
                                          .completedListsItems[index],
                                    ));
                                  },
                                  child: Card(
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              "ID: ${todoController.completedListsItems[index].id}"),
                                          Text(
                                              "User ID: ${todoController.completedListsItems[index].userId}"),
                                          Text(
                                              "Title: ${todoController.completedListsItems[index].title}"),
                                          Checkbox(
                                            value: todoController
                                                .completedListsItems[index]
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
