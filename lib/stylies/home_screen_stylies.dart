import 'package:first/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreenStylies {
  static const TextStyle appBarTitleStylies = TextStyle(
    color: AppColors.baseDarkPinkColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appBarBottomTitleStylies = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle trendingProductNameStylies = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    
  );

  static const TextStyle trendingProductModelStylies = TextStyle(
    fontSize: 16,
    color: AppColors.baseDarkPinkColor,
  );

  static const TextStyle trendingProductPriceStylies = TextStyle(
    fontSize: 16,
    color: AppColors.baseBlackColor,
  );
}
