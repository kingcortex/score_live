import 'package:dio/dio.dart';
import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';

class MatchApiService {
  MatchApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: url,
      headers: {
        'x-apisports-key': _API_KEY,
      },
      connectTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(minutes: 2),
    ));
  }
  String _API_KEY = "59db73280785309c6d97c05cf82415fc";
  final String url = "https://v3.football.api-sports.io";
  late Dio _dio;

  Future<List<MatchUpInfo>?> getMatchUpInfo(
      {Map<String, dynamic>? parameter}) async {
    print("ok2");
    try {
      var response = await _dio.get(
        "/fixtures",
        queryParameters: parameter,
        options: Options(
          headers: {
            'x-apisports-key': _API_KEY,
          },
        ),
      );
      if (response.statusCode == 200) {
        List data = response.data["response"];
        List<MatchUpInfo>? listMatchUpInfo =
            data.map((json) => MatchUpInfo.fromJson(json)).toList();
        print(listMatchUpInfo.length);
        return listMatchUpInfo;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
