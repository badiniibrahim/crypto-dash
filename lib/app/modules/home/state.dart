import 'package:coin/app/data/models/coin_model.dart';
import 'package:get/get.dart';

class HomeState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<CoinModel> _coinsList = <CoinModel>[].obs;
  set coinsList(value) => _coinsList.value = value;
  List<CoinModel> get coinsList => _coinsList;
}
