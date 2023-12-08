import 'dart:convert';
import 'package:bitcoin_ticker/config/api_config.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<String> getCoinData(
      String selectedCrypto, String selectedCurrency) async {
    http.Response response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/$selectedCrypto/$selectedCurrency?apikey=${ApiConfig.apiKey}"));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['rate'].toStringAsFixed(0);
    } else {
      print("STATUSCODE = ${response.statusCode}");
      throw 'Problem with the get request';
    }
  }
}
