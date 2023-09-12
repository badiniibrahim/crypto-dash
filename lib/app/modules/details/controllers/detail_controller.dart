import 'package:coin/app/data/models/coin_model.dart';
import 'package:coin/app/modules/details/state.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/abstractions/i_controller.dart';
import '../../../data/repositories/detail_repository.dart';

class DetailController extends GetxController with IController {
  final DetailState state = DetailState();
  final DetailRepository _repository = DetailRepository();
  late TrackballBehavior trackballBehavior;

  void setArgumentsInState() {
    if (Get.arguments['coin'] != null) {
      state.coinModel = Get.arguments['coin'] as CoinModel;
    }
  }

  Future<void> fetchChart(String name) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchChart(name);
        state.chartList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  @override
  void onInit() {
    setArgumentsInState();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.onInit();
  }
}
