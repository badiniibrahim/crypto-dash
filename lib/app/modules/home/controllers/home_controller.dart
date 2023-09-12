import 'dart:async';

import 'package:coin/app/modules/home/state.dart';
import 'package:get/get.dart';

import '../../../core/abstractions/i_controller.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController with IController {
  final HomeRepository _repository = HomeRepository();
  final HomeState state = HomeState();

  Future<void> fetchCoinList() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchCoinList();
        state.coinsList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
