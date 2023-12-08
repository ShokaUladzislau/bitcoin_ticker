Coin Ticker App

  <div> 
    <img src="https://badgen.net/pub/dart-platform/google_sign_in"/>
    <img src="https://badgen.net/badge/API/http.dart/green"/>
  </div>

Welcome to the Coin Ticker App! This Flutter-based mobile application provides real-time cryptocurrency prices and information, allowing users to stay up-to-date with the latest market trends. The app leverages RESTful APIs to fetch and display accurate cryptocurrency data, while incorporating Flutter widgets and Material Design principles for a sleek and intuitive user interface.

  <p float="left">
    <img src="https://github.com/ShokaUladzislau/coin_ticker/blob/main/demo/screen.PNG" width="250"/>
    <img src="https://github.com/ShokaUladzislau/coin_ticker/blob/main/demo/demo.gif" width="250"/>
  </p>



Features

Real-Time Data: Get instant access to live cryptocurrency prices, volume, and other relevant data.
Multiple Cryptocurrencies: Track a wide range of cryptocurrencies to stay informed about your favorite digital assets.
User-Friendly Interface: Experience a seamless and intuitive user interface designed with Flutter widgets and Material Design principles.

Installation

Follow these steps to get started with the Crypto Coin Ticker App:

 - Clone the Repository:
   git clone https://github.com/ShokaUladzislau/coin_ticker
 - Navigate to the Project Directory:
   cd coin_ticker
 - Install Dependencies:
   flutter pub get
 - Run the App:
   flutter run



Configuration

The app utilizes RESTful API [Coin API](https://www.coinapi.io) to fetch cryptocurrency data. To configure the API integration, follow these steps:

Obtain an API key from cryptocurrency data provider. For example - https://www.coinapi.io/market-data-api/pricing
Open the lib/config/api_config.dart file.
Replace the placeholder API key with your actual API key.

Copy code
class ApiConfig {
  static const String apiKey = 'YOUR_API_KEY';
}
Dependencies

The Crypto Coin Ticker App relies on the following key dependencies:

http: To make HTTP requests and fetch cryptocurrency data.
cupertino_icons: This package provides the Cupertino styled icons for iOS.
material: core Flutter package for Material Design widgets.
Refer to the pubspec.yaml file for the complete list of dependencies.


Happy tracking and enjoy using the Crypto Coin Ticker App! 🚀📈
