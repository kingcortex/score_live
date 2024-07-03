import 'package:score_live/features/matches_and_competitions/data/models/fixture.dart';
import 'package:score_live/features/matches_and_competitions/data/models/league.dart';

class MatchUpInfo {
  Fixture fixture;
  League league;
  Goals teams;
  Goals goals;
  Score score;

  MatchUpInfo({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory MatchUpInfo.fromJson(Map<String, dynamic> json) => MatchUpInfo(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Goals.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "fixture": fixture.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "goals": goals.toJson(),
        "score": score.toJson(),
      };
}



class Periods {
  int? first;
  int? second;

  Periods({
    required this.first,
    required this.second,
  });

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
      };
}

class Status {
  Long? long;
  Short? short;
  int? elapsed;

  Status({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: longValues.map[json["long"]],
        short: shortValues.map[json["short"]],
        elapsed: json["elapsed"],
      );

  Map<String, dynamic> toJson() => {
        "long": longValues.reverse[long],
        "short": shortValues.reverse[short],
        "elapsed": elapsed,
      };
}

enum Long {
  FIRST_HALF,
  HALFTIME,
  MATCH_CANCELLED,
  MATCH_FINISHED,
  MATCH_POSTPONED,
  NOT_STARTED,
  SECOND_HALF,
  TECHNICAL_LOSS
}

final longValues = EnumValues({
  "First Half": Long.FIRST_HALF,
  "Halftime": Long.HALFTIME,
  "Match Cancelled": Long.MATCH_CANCELLED,
  "Match Finished": Long.MATCH_FINISHED,
  "Match Postponed": Long.MATCH_POSTPONED,
  "Not Started": Long.NOT_STARTED,
  "Second Half": Long.SECOND_HALF,
  "Technical loss": Long.TECHNICAL_LOSS
});

enum Short { AWD, CANC, FT, HT, NS, PST, THE_1_H, THE_2_H }

final shortValues = EnumValues({
  "AWD": Short.AWD,
  "CANC": Short.CANC,
  "FT": Short.FT,
  "HT": Short.HT,
  "NS": Short.NS,
  "PST": Short.PST,
  "1H": Short.THE_1_H,
  "2H": Short.THE_2_H
});

enum Timezone { UTC }

final timezoneValues = EnumValues({"UTC": Timezone.UTC});

class Venue {
  int? id;
  String? name;
  String? city;

  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}

class Goals {
  dynamic home;
  dynamic away;

  Goals({
    required this.home,
    required this.away,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}

class AwayClass {
  int id;
  String name;
  String logo;
  bool? winner;

  AwayClass({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner,
      };
}



class Score {
  Goals halftime;
  Goals fulltime;
  Goals extratime;
  Goals penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "halftime": halftime.toJson(),
        "fulltime": fulltime.toJson(),
        "extratime": extratime.toJson(),
        "penalty": penalty.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
