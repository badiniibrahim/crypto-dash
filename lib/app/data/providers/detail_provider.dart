import 'package:dio/dio.dart';

import '../../core/abstractions/i_provider.dart';
import '../../core/provider/api_provider.dart';

class DetailProvider extends IProvider<Response> {
  @override
  String get endpoint => "coins";

  Future<Response> fetchChart(String name) async {
    return await ApiProvider.instance.get(
      endpoint: "/$endpoint/$name/ohlc?vs_currency=usd&days=1",
    );
  }

  Future<Response> fetchNews(String name) async {
    return await ApiProvider.instance.get(
      endpoint:
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=98ebf7afc75a4eecaea053852268bc33&language=fr",
    );
  }
}
