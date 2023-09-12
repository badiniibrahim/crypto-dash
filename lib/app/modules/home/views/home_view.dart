import 'package:coin/app/ui/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utilities/size_config.dart';
import '../controllers/home_controller.dart';
import '../widgets/coin_item_widget.dart';
import '../widgets/header_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {
        controller.fetchCoinList();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 30.0, top: 60.0),
            child: Obx(
              () => controller.state.isLoading
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeaderWidget(),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.state.coinsList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CoinItemWidget(
                                  coin: controller.state.coinsList[index]);
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
