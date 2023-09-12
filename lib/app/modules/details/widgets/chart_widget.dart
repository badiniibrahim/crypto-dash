import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_model.dart';
import '../controllers/detail_controller.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: SfCartesianChart(
        trackballBehavior: controller.trackballBehavior,
        zoomPanBehavior:
            ZoomPanBehavior(enablePinching: true, zoomMode: ZoomMode.x),
        series: <CandleSeries>[
          CandleSeries<ChartModel, int>(
            enableSolidCandles: true,
            enableTooltip: true,
            bullColor: Colors.green,
            bearColor: Colors.red,
            dataSource: controller.state.chartList,
            xValueMapper: (ChartModel sales, _) => sales.time,
            lowValueMapper: (ChartModel sales, _) => sales.low,
            highValueMapper: (ChartModel sales, _) => sales.high,
            openValueMapper: (ChartModel sales, _) => sales.open,
            closeValueMapper: (ChartModel sales, _) => sales.close,
            animationDuration: 55,
          )
        ],
      ),
    );
  }
}
