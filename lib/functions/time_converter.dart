import 'dart:convert';

import '../models/time_zone_modal.dart';
import 'package:http/http.dart' as http;

Future<TimeZoneModel> pickTime(
  String fromTimeZone,
  String dateTime,
  String toTimeZone,
  String dstAmbiguity,
) async {
  final response = await http.post(
    Uri.parse('https://timeapi.io/api/Conversion/ConvertTimeZone'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "fromTimeZone": fromTimeZone,
      "dateTime": dateTime,
      "toTimeZone": toTimeZone,
      "dstAmbiguity": dstAmbiguity
    }),
  );

  if (response.statusCode == 200) {
    return TimeZoneModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to Get time Zone');
  }
}
