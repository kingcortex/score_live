import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppController extends GetxController {
  late Rx<StatefulNavigationShell> navigationShell;
  var selectedIndex = 0.obs;

  void setNavigationShell(StatefulNavigationShell shell) {
    navigationShell = shell.obs;
  }

  void goToBranch(int index) {
    navigationShell.value.goBranch(index, initialLocation: index == navigationShell.value.currentIndex);
    selectedIndex.value = index;
  }
}
