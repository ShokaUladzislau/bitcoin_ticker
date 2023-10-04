import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'crypto_card.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<CryptoCard> cryptocards = [
    CryptoCard(cryptoList[0]),
    CryptoCard(cryptoList[1]),
    CryptoCard(cryptoList[2]),
  ];

  void getCards(String currency) async {
    for (CryptoCard card in cryptocards) {
      await card.updateInfo(currency);
    }
    setState(() {});
  }

  DropdownButton<String> getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: currenciesList[0],
      items: dropdownItems,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (value) async {
          getCards(currenciesList[value]);
        },
        children: pickerItems);
  }

  Widget getOSPicker() {
    if (Platform.isIOS) {
      return getCupertinoPicker();
    } else if (Platform.isAndroid) {
      return getAndroidDropdown();
    } else
      return Text('Undefined OS');
  }

  @override
  void initState() {
    super.initState();
    getCards(currenciesList[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: cryptocards[0].getCard(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: cryptocards[1].getCard(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: cryptocards[2].getCard(),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getOSPicker(),
          ),
        ],
      ),
    );
  }
}
