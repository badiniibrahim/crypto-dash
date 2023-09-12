import 'package:coin/app/modules/details/bindings/detail_binding.dart';
import 'package:coin/app/modules/details/views/detail_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () =>  DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
