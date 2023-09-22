import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCrypto = "";
  String selectedCurrency = "";
  String rate = "?";

  void updateInfo(String selectedCurrency) async {
    var data = await CoinData().getCoinData(selectedCurrency);
    setState(() {
      selectedCrypto = data['asset_id_base'];
      this.selectedCurrency = data['asset_id_quote'];
      rate = data['rate'].toStringAsFixed(0);
    });
  }

  //CoinData coinData = CoinData();

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
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          updateInfo(selectedCurrency);
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
        onSelectedItemChanged: (value) {
          setState(() {
            selectedCurrency = currenciesList[value];
            rate = "?";
            updateInfo(selectedCurrency);
          });
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
    updateInfo(currenciesList[0]);
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $selectedCrypto = $rate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
