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
  late CryptoCard cryptoCard0;
  late CryptoCard cryptoCard1;
  late CryptoCard cryptoCard2;

  void getInitCards() async {
    cryptoCard0 = CryptoCard(cryptoList[0]);
    cryptoCard1 = CryptoCard(cryptoList[1]);
    cryptoCard2 = CryptoCard(cryptoList[2]);
    await cryptoCard0.updateInfo(currenciesList[0]);
    await cryptoCard1.updateInfo(currenciesList[0]);
    await cryptoCard2.updateInfo(currenciesList[0]);

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
        setState(() {
          //selectedCurrency = value!;
          //updateInfo(selectedCrypto, selectedCurrency);
        });
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
          await cryptoCard0.updateInfo(currenciesList[value]);
          setState(() {});
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
    getInitCards();
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
                child: cryptoCard0.getCard(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: cryptoCard1.getCard(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: cryptoCard2.getCard(),
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
