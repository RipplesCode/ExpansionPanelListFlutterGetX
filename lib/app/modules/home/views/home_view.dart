import 'package:expansion_panel_list_flutter_getx/app/data/Employee.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel List'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Obx(() => ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                controller.employee[panelIndex].isExpanded!.value = !isExpanded;
              },
              children:
                  controller.employee.map<ExpansionPanel>((Employee item) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: ((context, isExpanded) {
                      return ListTile(title: Text(item.header!));
                    }),
                    body: ListTile(
                      title: Text(item.body!),
                    ),
                    isExpanded: item.isExpanded!.value);
              }).toList())),
        ),
      ),
    );
  }
}
