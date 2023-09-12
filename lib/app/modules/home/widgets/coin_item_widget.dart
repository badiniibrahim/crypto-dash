import 'package:coin/app/data/models/coin_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';
import '../../../routes/app_pages.dart';

class CoinItemWidget extends StatelessWidget {
  final CoinModel coin;
  const CoinItemWidget({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.DETAIL,
          arguments: {
            "coin": coin,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(coin.image ?? ""),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        coin.name ?? "",
                        style:
                            AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                          color: AppColors.white,
                          fontFamily: 'muli',
                        ),
                      ),
                      Text(
                        "${coin.priceChangePercentage24H?.toStringAsFixed(2)} %",
                        style:
                            AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                          color: AppColors.white,
                          fontFamily: 'muli',
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ ${coin.currentPrice?.round()}",
                    style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                      color: AppColors.white,
                      fontFamily: 'muli',
                    ),
                  ),
                  Text(
                    coin.symbol?.toUpperCase() ?? "",
                    style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                      color: AppColors.white,
                      fontFamily: 'muli',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
