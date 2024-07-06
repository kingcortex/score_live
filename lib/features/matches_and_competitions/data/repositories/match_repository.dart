import 'package:score_live/core/services/match_api_service.dart';
import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';

class MatchRepository {
  late MatchApiService matchApiService;
  MatchRepository() {
    matchApiService = MatchApiService();
  }
   Future<List<MatchUpInfo>?> live() async {
    print("OK1");
    final params = {"live": "all"};
    final listLive = await matchApiService.getMatchUpInfo(parameter: params);
    print("hh");
    if (listLive != null) {
      return listLive;
    }
    return null;
  }
}
