import 'package:coin/app/data/models/coin_model.dart';
import 'package:coin/app/data/providers/home_provider.dart';
import 'package:dio/dio.dart';

import '../../core/abstractions/i_repository.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<List<CoinModel>> fetchCoinList() async {
    final response = await provider.fetchCoinList();
    var coins = response.data as List;
    List<CoinModel> coinList = coins.map((m) => CoinModel.fromJson(m)).toList();
    return coinList;
  }
}
