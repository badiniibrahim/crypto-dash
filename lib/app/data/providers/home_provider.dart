import 'package:dio/dio.dart';

import '../../core/abstractions/i_provider.dart';
import '../../core/provider/api_provider.dart';

class HomeProvider extends IProvider<Response> {
  @override
  String get endpoint => "/coins/markets";

  Future<Response> fetchCoinList() async {
    return await ApiProvider.instance.get(
      endpoint: "/$endpoint?vs_currency=usd&sparkline=true",
    );
  }
}
