import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dans son rapport",
            style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
              color: AppColors.white,
              fontSize: 19,
              fontFamily: 'muli',
            ),
          ),
          const SizedBox(height: 9),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Dans son rapport annuel \"Big Idea\", Ark Invest explique comment le minage de Bitcoin pourrait être utilisé pour soutenir la production d'énergie solaire",
                  textAlign: TextAlign.justify,
                  style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'muli',
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.04,
                  backgroundImage: const NetworkImage(
                      "https://www.presse-citron.net/app/uploads/2021/10/Bitcoin-1.jpg"),
                ),
              )
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Text(
                "Auteur :",
                textAlign: TextAlign.justify,
                style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'muli',
                ),
              ),
              const SizedBox(width: 9),
              Text(
                "Auteur",
                textAlign: TextAlign.justify,
                style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'muli',
                ),
              )
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Text(
                "Source : ",
                textAlign: TextAlign.justify,
                style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'muli',
                ),
              ),
              const SizedBox(width: 9),
              Text(
                "Auteur",
                textAlign: TextAlign.justify,
                style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'muli',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
