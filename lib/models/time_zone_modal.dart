class TimeZoneModel {
  TimeZoneModel({
    required this.fromTimezone,
    required this.fromDateTime,
    required this.toTimeZone,
    this.conversionResult,
  });

  final String fromTimezone;
  final String fromDateTime;
  final String toTimeZone;

  TimeZone? conversionResult;

  factory TimeZoneModel.fromJson(Map<String, dynamic> json) => switch (json) {
        {
          'fromTimezone': String fromTimezone,
          'fromDateTime': String fromDateTime,
          'toTimeZone': String toTimeZone,
          'conversionResult': Map<String, dynamic> conversionResult,
        } =>
          TimeZoneModel(
            fromDateTime: fromDateTime,
            fromTimezone: fromTimezone,
            toTimeZone: toTimeZone,
            conversionResult: TimeZone.fromJson(conversionResult),
          ),
        _ => throw const FormatException('Failed to load Product.'),
      };
  Map<String, dynamic> toJson() => {
        "fromTimezone": fromTimezone,
        "fromDateTime": fromDateTime,
        "toTimeZone": toTimeZone,
        "conversionResult": conversionResult
      };
}

class TimeZone {
  final String dateTime;
  final String date;
  final String time;
  final String timeZone;

  TimeZone({
    required this.dateTime,
    required this.date,
    required this.time,
    required this.timeZone,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'dateTime': String dateTime,
        'date': String date,
        'time': String time,
        'timeZone': String timeZone,
      } =>
        TimeZone(
            dateTime: dateTime, date: date, time: time, timeZone: timeZone),
      _ => throw const FormatException('Failed to load Time  Zone.'),
    };
  }
}
