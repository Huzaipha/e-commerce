// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../data/home_page_data.dart';
import '../models/SingleProductModel.dart';
import '../widgets/singleProduct_widget.dart';

class TabBatBar extends StatelessWidget {
  final List<SingleProductModel> productData;
  const TabBatBar({required this.productData});
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: true,
      itemCount: colothsData.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          onPressed: () {},
          productImage: data.productFourImage,
          productModel: data.productModel,
          productPrice: data.productPrice,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
        );
      },
    );
  }
}
