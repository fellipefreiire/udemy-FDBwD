import 'dart:io' show Platform;
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String BtcConvertedValue = '?';
  String EthConvertedValue = '?';
  String LtcConvertedValue = '?';

  Widget getAllCryptoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoList.asMap().entries.map((crypto) {
        // String convertedValue = '?';
        // if (crypto == 'BTC') {
        //   convertedValue = BtcConvertedValue;
        // }
        // if (crypto == 'ETH') {
        //   convertedValue = EthConvertedValue;
        // }
        // if (crypto == 'LTC') {
        //   convertedValue = LtcConvertedValue;
        // }
        // print(LtcConvertedValue);
        String convertedValue = crypto.value == 'BTC'
            ? BtcConvertedValue
            : crypto.value == 'ETH'
                ? EthConvertedValue
                : crypto.value == 'LTC'
                    ? LtcConvertedValue
                    : '?';

        return Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 ${crypto.value} = $convertedValue $selectedCurrency',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget getDropdownButton() {
    if (Platform.isAndroid) {
      return DropdownButton<String>(
        value: selectedCurrency,
        items: currenciesList
            .map(
              (coin) => DropdownMenuItem<String>(
                child: Text(coin),
                value: coin,
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCurrency = value.toString();
            updateUi(selectedCurrency);
          });
        },
      );
    }

    if (Platform.isIOS) {
      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex].toString();
            updateUi(selectedCurrency);
          });
        },
        children: currenciesList.map((coin) => Text(coin)).toList(),
      );
    }

    return Text('Dropdown didn\'t loaded as expected!');
  }

  void updateUi(String currency) async {
    int btcValue = await CoinData().getCoinData('BTC', currency);
    int ethValue = await CoinData().getCoinData('ETH', currency);
    int ltcValue = await CoinData().getCoinData('LTC', currency);
    setState(() {
      BtcConvertedValue = btcValue.toString();
      EthConvertedValue = ethValue.toString();
      LtcConvertedValue = ltcValue.toString();
    });
  }

  @override
  void initState() {
    super.initState();

    updateUi('USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getAllCryptoCard(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
