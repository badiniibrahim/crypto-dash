import 'package:coin/app/data/models/chart_model.dart';
import 'package:coin/app/data/models/coin_model.dart';
import 'package:get/get.dart';

class DetailState {
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final _coinModel = Rx(CoinModel());
  CoinModel get coinModel => _coinModel.value;
  set coinModel(value) => _coinModel.value = value;

  final RxList<ChartModel> _chartList = <ChartModel>[].obs;
  set chartList(value) => _chartList.value = value;
  List<ChartModel> get chartList => _chartList;
}
