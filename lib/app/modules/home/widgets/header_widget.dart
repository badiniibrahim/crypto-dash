import 'package:flutter/cupertino.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Crypto Dash",
      style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
        color: AppColors.white,
        fontSize: 25,
        fontFamily: 'muli',
      ),
    );
  }
}
