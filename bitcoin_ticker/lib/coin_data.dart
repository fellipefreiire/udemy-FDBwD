import 'package:bitcoin_ticker/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future<int> getCoinData(String crypto, String currency) async {
    Uri uri =
        Uri.http('rest.coinapi.io', '/v1/exchangerate/$crypto/$currency', {
      'apiKey': apiKey,
    });

    NetworkHelper networkHelper = NetworkHelper(uri);

    var exchangedCurrency = await networkHelper.getData();

    return exchangedCurrency.toInt();
  }
}
