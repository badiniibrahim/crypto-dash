import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:coin/app/data/models/coin_model.dart';
import 'package:coin/app/modules/details/controllers/detail_controller.dart';
import 'package:coin/app/ui/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utilities/size_config.dart';
import '../../home/widgets/coin_item_widget.dart';
import '../widgets/chart_widget.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  CoinModel get coin => controller.state.coinModel;

  AppBar _appBar(String title) {
    return AppBar(
      title: Text(title),
      titleTextStyle: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
        color: AppColors.white,
        fontSize: 25,
        fontFamily: 'muli',
      ),
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<DetailController>(
      init: DetailController(),
      initState: (_) {
        controller.fetchChart(coin.id ?? "");
      },
      builder: (_) {
        return Scaffold(
          appBar: _appBar(coin.name ?? ""),
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CoinItemWidget(coin: coin),
                const SizedBox(height: 20.0),
                Obx(
                  () => controller.state.isLoading
                      ? const Center(
                          child: LoadingWidget(),
                        )
                      : ChartWidget(controller: controller),
                ),
                const SizedBox(height: 20.0),
                Obx(
                  () => controller.state.isLoading
                      ? Container()
                      : Sparkline(
                          data: coin.sparklineIn7D?.price ?? [],
                          lineWidth: 2.0,
                          lineColor: coin.marketCapChangePercentage24H! >= 0
                              ? Colors.green
                              : Colors.red,
                          fillMode: FillMode.below,
                          fillGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.7],
                            colors: coin.marketCapChangePercentage24H! >= 0
                                ? [Colors.green, Colors.green.shade100]
                                : [Colors.red, Colors.red.shade100],
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
