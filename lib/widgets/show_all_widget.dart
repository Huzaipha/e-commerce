// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:first/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class ShowAllWidget extends StatelessWidget {
  final String leftText;
  ShowAllWidget({required this.leftText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato",
            color: AppColors.baseBlackColor),
          ),
          Text(
            "Show All",
            style: TextStyle(color: AppColors.baseDarkPinkColor, fontSize: 17),
          )
        ],
      ),
    );
  }
}
