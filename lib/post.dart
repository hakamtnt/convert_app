class RateList {
  double aud;
  double bgn;
  double brl;
  double cad;
  double chf;
  double inr;


  RateList(
      {required this.aud,
      required this.bgn,
      required this.brl,
      required this.cad,
      required this.chf,
      required this.inr,
      });

  factory RateList.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'AUD': double aud,
        'BGN': double bgn,
        'BRL': double brl,
        'CAD': double cad,
        'CHF': double chf,
        'INR': double inr,

      } =>
        RateList(
            aud: aud,
            bgn: bgn,
            brl: brl,
            cad: cad,
            chf: chf,
            inr: inr,
            ),
      _ => throw const FormatException('Failed to load Amount.'),
    };
  }
}

// "AUD": 1.4982001754,
// "BGN": 1.7833002042,
// "BRL": 4.8793607414,
// "CAD": 1.3498001755,
// "CHF": 0.8693901608,
// "CNY": 7.1383807648,
// "CZK": 22.2644341803,
// "DKK": 6.8506906875,
// "EUR": 0.9189101681,
// "GBP": 0.7869401409,
// "HKD": 7.8131710061,
// "HRK": 7.0431607429,
// "HUF": 347.4841860608,
// "IDR": 15468.312164603,
// "ILS": 3.7071206648,
// "INR": 83.2334018947,
// "ISK": 138.8269939082,
// "JPY": 146.847535431,
// "KRW": 1292.6564687036,
// "MXN": 17.1687418296,
// "MYR": 4.6717007064,
// "NOK": 10.6668618331,
// "NZD": 1.610130317,
// "PHP": 55.462176809,
// "PLN": 3.9700006593,
// "RON": 4.5575908292,
// "RUB": 90.5708601226,
// "SEK": 10.3790713865,
// "SGD": 1.3335901795,
// "THB": 34.8807059904,
// "TRY": 28.8609035227,
// "USD": 1,
// "ZAR": 18.6337130014
