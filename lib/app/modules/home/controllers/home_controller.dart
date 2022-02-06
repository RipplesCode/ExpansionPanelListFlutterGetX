import 'package:expansion_panel_list_flutter_getx/app/data/Employee.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late List<Employee> employee;
  @override
  void onInit() {
    super.onInit();
    employee = generateItems(20);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  List<Employee> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Employee(
          header: 'Employee - $index',
          body: 'Employee - $index Details',
          isExpanded: false.obs);
    });
  }
}
