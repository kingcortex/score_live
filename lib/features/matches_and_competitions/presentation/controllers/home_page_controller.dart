import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_live/core/utils/helpers/helpers_functions.dart';

class HomePageController extends GetxController {
  int initialDateIndex = 8;
  List<DateTime> listDates = HelpersFunctions.getLastNextDays(range: 8);
  late TabController dateTabController;
  


  void setDateTabController(TabController controller_) {
    dateTabController = controller_;
  }

  
  @override
  void onClose() {
    dateTabController.dispose();
    super.onClose();
  }
}
