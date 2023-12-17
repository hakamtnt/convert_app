import 'dart:convert';
import 'package:http/http.dart' as http;

PickTimeModel timeZoneModelFromJson(String str) =>
    PickTimeModel.fromJson(json.decode(str));

class PickTimeModel {
  final String timeZone;
  final String currentLocalTime;

  const PickTimeModel({
    required this.currentLocalTime,
    required this.timeZone,
  });

  factory PickTimeModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'timeZone': String timeZone,
        'currentLocalTime': String currentLocalTime,
      } =>
        PickTimeModel(
          timeZone: timeZone,
          currentLocalTime: currentLocalTime,
        ),
      _ => throw const FormatException('Failed to load time zone .'),
    };
  }
}

final baseUrl = 'https://timeapi.io/api/TimeZone/zone?timeZone=';
Future<PickTimeModel> pickTime({required String zone}) async {
  final response = await http.get(Uri.parse('$baseUrl$zone'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return timeZoneModelFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album 222');
  }
}

// "timeZone": "Asia/Kuwait",
// "currentLocalTime": "2023-12-14T09:32:43.0943225",
