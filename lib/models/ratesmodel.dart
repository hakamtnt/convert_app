import 'dart:convert';

RatesModel ratesModelFromJson(String str) =>
    RatesModel.fromJson(json.decode(str));

AllCity getAllCity (String str) => AllCity.fromJson(json.decode(str));


class RatesModel {
  RatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        disclaimer: json[""
            "disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

//OMR

RateList ratesList(String str) => RateList.fromJson(json.decode(str));

class RateList {
  RateList({
    required this.rate,
  });

  RateAll rate;

  factory RateList.fromJson(Map<String, dynamic> json) => switch (json) {
        {
          'rates': Map<String, dynamic> rates,
        } =>
          RateList(
            rate: RateAll.fromJson(rates),
          ),
        _ => throw const FormatException('Failed to load Product.'),
      };
  Map<String, dynamic> toJson() => {
        "rates": rate,
      };
}

class RateAll {
  final double aud;
  final double gbp;
  final double inr;
  final double omr;

  RateAll(
      {required this.aud,
      required this.gbp,
      required this.inr,
      required this.omr});

  factory RateAll.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'AUD': double aud,
        'GBP': double gbp,
        'INR': double inr,
        'OMR': double omr,
      } =>
        RateAll(
          aud: aud,
          gbp: gbp,
          inr: inr,
          omr: omr,
        ),
      _ => throw const FormatException(
          'Failed to load Product from sub model class.'),
    };
  }

  Map<String, dynamic> toJson() => {
        'AUD': aud,
        "GBP": gbp,
        'INR': inr,
      };
}

class AllCity {
 final String str;

  AllCity(
      {required this.str});

  factory AllCity.fromJson(Map<String , String> json) {
    return switch (json) {
      {
      List: String str,

      } =>
          AllCity(
            str: str
          ),
      _ => throw const FormatException(
          'Failed to load Product from sub model class.'),
    };
  }

}



