import 'package:coin/app/data/models/chart_model.dart';
import 'package:coin/app/data/models/new_model.dart';
import 'package:dio/dio.dart';

import '../../core/abstractions/i_repository.dart';
import '../providers/detail_provider.dart';

class DetailRepository extends IRepository<Response> {
  @override
  DetailProvider get provider => DetailProvider();

  Future<List<ChartModel>> fetchChart(String name) async {
    final response = await provider.fetchChart(name);
    var charts = response.data as List;
    List<ChartModel> chartList =
        charts.map((m) => ChartModel.fromJson(m)).toList();
    return chartList;
  }
}
