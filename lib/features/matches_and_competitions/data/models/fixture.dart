import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';

class Fixture {
  int id;
  String? referee;
  Timezone? timezone;
  DateTime date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: timezoneValues.map[json["timezone"]],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezoneValues.reverse[timezone],
        "date": date.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods.toJson(),
        "venue": venue.toJson(),
        "status": status.toJson(),
      };
}