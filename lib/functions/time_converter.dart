import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// POST /Conversion/ConvertTimeZone
// {
// "fromTimeZone": "Europe/Amsterdam",
// "dateTime": "2021-03-14 17:45:00",
// "toTimeZone": "America/Los_Angeles",
// "dstAmbiguity": ""
// }

class TimeConverter extends ChangeNotifier {
  bool _isLoading = false;
  String _resMessage = '';

  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  final String url = 'https://timeapi.io/api/Conversion/ConvertTimeZone';

  void convertTime({
    required String fromTimeZone,
    required String dateTime,
    required String toTimeZone,
    required String dstAmbiguity,

  }) async {
    _isLoading = true;
    notifyListeners();

    final body = {
      "fromTimeZone": fromTimeZone,
      "dateTime": dateTime,
      "toTimeZone": toTimeZone,
      "dstAmbiguity": dstAmbiguity,
    };

    try {
      http.Response req = await http.post(Uri.parse(url), body: (body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Time get successfully";
        notifyListeners();
      } else {
        final res = json.decode(req.
        body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    _isLoading = false;
    notifyListeners();
  }
}
