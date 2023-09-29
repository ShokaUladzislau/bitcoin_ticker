import 'package:flutter/material.dart';
import 'coin_data.dart';

class CryptoCard {
  late String selectedCrypto;
  late String selectedCurrency;
  String rate = '?';

  CryptoCard(this.selectedCrypto) {}

  Future updateInfo(String selectedCurrency) async {
    this.selectedCurrency = selectedCurrency;
    rate = await CoinData().getCoinData(selectedCrypto, selectedCurrency);
    print('updateInfo rate = $rate');
  }

  Widget getCard() {
    return Card(
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
    );
  }
}
