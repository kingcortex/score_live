import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:score_live/core/utils/helpers/helpers_functions.dart';
import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';
import 'package:score_live/features/matches_and_competitions/data/repositories/match_repository.dart';

class HomePageBodyController extends GetxController {
  final DateTime date;
  final DateTime today = HelpersFunctions.getDateOnly(DateTime.now());
  late MatchRepository matchRepository;
  HomePageBodyController(this.date);
  late TabController sectionTabController;
  late int tabLength;
  late bool hasUpcommig;
  late bool hasScore;

  @override
  void onInit() {
    matchRepository = MatchRepository();
    if (date == today) {
      tabLength = 3;
      hasUpcommig = true;
      hasScore = true;
    } else if (date.isBefore(today)) {
      tabLength = 2;
      hasUpcommig = false;
      hasScore = true;
    } else {
      tabLength = 2;
      hasUpcommig = true;
      hasScore = false;
    }
    super.onInit();
  }

  Future<List<MatchUpInfo>> getLiveFixtures() async {
    await Future.delayed(const Duration(seconds: 3));
    final String response =
        await rootBundle.loadString('assets/json/live_test.json');
    final dynamic data = await json.decode(response);
    List<dynamic> listJson = data["response"];

    var fixtures = listJson.map((json) => MatchUpInfo.fromJson(json)).toList();

    return fixtures;
    //print(fixtures.length);
  }

  Future<List<MatchUpInfo>?> getLiveFixtures_() async {
    List<MatchUpInfo>? fixtures = await matchRepository.live();

    return fixtures;
    //print(fixtures.length);
  }

  //Future<List<MatchUpInfo>> getScroresFixtures() async{
//
 // }




  void setSectionTabController(TabController controller_) {
    sectionTabController = controller_;
  }

  @override
  void onClose() {
    sectionTabController.dispose();
    super.onClose();
  }
}
