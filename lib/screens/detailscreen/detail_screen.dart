// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes

import 'package:first/appColors/app_colors.dart';
import 'package:first/models/SingleProductModel.dart';
import 'package:first/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../stylies/details_screen_stylies.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;

  const DetailScreen({super.key, required this.data, required String title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reebok",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
              color: AppColors.baseBlackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("images/download.png"),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.productName,
                  style: DetailScreenStylies.companytitleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(widget.data.productModel,
                style: DetailScreenStylies.productModelStyle,),
              ],
            ),

            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ],
            ),
          ),
        ],
      ),
    );
  }
}
