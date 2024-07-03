import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMatchPageController extends GetxController {
  int initialDateIndex = 8;
  late TabController tabController;

  void setTabController(TabController controller_) {
    tabController = controller_;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
