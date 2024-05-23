// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unused_import

// import 'package:another_carousel_pro/another_carousel_pro.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:first/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/home_page_data.dart';
import '../../routes/routes.dart';
import '../../stylies/home_screen_stylies.dart';
import '../../svgimages/svg_images.dart';
import '../../widgets/show_all_widget.dart';

import '../../widgets/singleProduct_widget.dart';

import '../detailscreen/detail_screen.dart';
import '../tabbar-data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});
  AppBar BuildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        tabs: [
          Text("ALL"),
          Text("Shoes"),
          Text("Clothes"),
          Text("Accessories"),
        ],
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Welcome Gee",
            style: HomeScreenStylies.appBarTitleStylies,
          ),
          Text(
            "Shopping",
            style: HomeScreenStylies.appBarBottomTitleStylies,
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.search,
              color: AppColors.baseBlackColor,
            )),
      ],
    );
  }

  Widget buildAdvertisementPlace() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Container(
        height: 170,
        // child:
        // Carousel(
        // autoplay: true,
        // animationCurve: Curves.fastEaseInToSlowEaseOut,
        // animationDuration: Duration(milliseconds: 1000),
        // showIndicator: false,
        // images: [
        //   Container(
        //     margin: EdgeInsets.only(right: 10),
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: NetworkImage(
        //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzNsF4Ce7fwLbJxZWLJyZvgQy25VqREhdf0A&usqp=CAU"),
        //       ),
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //   ),
        //   Container(
        //     margin: EdgeInsets.only(right: 10),
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: NetworkImage(
        //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_z4fNAB29kcldimibbSOX8IVPn6bB8rNWfw&usqp=CAU"),
        //       ),
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //   ),
        // ],
      ),
    );
  }

  Widget buildTrendingProduct(
      {required String productImage,
      required String productName,
      required String productModel,
      required double productPrice}) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 20,
        top: 30,
        bottom: 20,
      ),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStylies.trendingProductNameStylies,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel,
                    style: HomeScreenStylies.trendingProductModelStylies,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: MaterialButton(
              color: AppColors.baseDarkPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(0.7),
                side: BorderSide.none,
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStylies.trendingProductPriceStylies,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: BuildAppBar(),
        // Call the method to include the app bar
        body: TabBarView(
          children: [
            // Add your content here
            //All
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildAdvertisementPlace(),
                ShowAllWidget(
                  leftText: "New Arrivals",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: sigleProductData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      var data = sigleProductData[index];
                      return SingleProductWidget(
                        productImage: data.productFourImage,
                        productModel: data.productModel,
                        productPrice: data.productPrice,
                        productName: data.productName,
                        productOldPrice: data.productOldPrice,
                        onPressed: () {
                          // PageRouting.goToNextPage(
                          //     context: context,
                          //     navigateTo: DetailScreen(data: data, title: ""));
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ShowAllWidget(
                  leftText: "What's Trending",
                ),
                buildTrendingProduct(
                  productImage:
                      'data:image/jpeg;base64,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',
                  productModel: 'Tank-tops',
                  productName: 'Mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsK1X8HdPknM-R0K4YiDuZ9jIXYWLWJ58N10rHw9zJHA&s',
                  productModel: 'Sneakers',
                  productName: 'Nike AJ High',
                  productPrice: 650,
                ),
                buildTrendingProduct(
                  productImage:
                      'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHwAfAMBIgACEQEDEQH/xAAbAAEBAQEBAQEBAAAAAAAAAAAAAQYFBAIDB//EADQQAAEEAQIEBAUCBQUAAAAAAAEAAgMEEQUSITFBUQYTYfAUInGBkTLBI0JSoeEVJDNisf/EABgBAQADAQAAAAAAAAAAAAAAAAABAwQC/8QAIxEAAwEAAQMDBQAAAAAAAAAAAAECEQMhMVESIkEyM2GB8P/aAAwDAQACEQMRAD8A79LTNR+E/wBX+LjLY2h7DJJlz3sd2PcAr+jabcbeoQWmDhKwHHY9R+VgZm09HtWa1zT/AIiSOUug3vLWiM8Afx+60/geVrtHdFuG6OVw2g/pB4hZuJ5WFt9tNFxz6IoOeF9LSVERVEBEVRARFUQERVEBEPEIiA5fiGx8JpMzmcHOGxoHr/jK4raOowRRxN0albDG480ubx/JC9fiX/fWYKDZI2MYfNkMhwDjkM9FmZ7k+kyurWbUrJv1OEMx28eXI88YWa6SrWWSuhofE8DY9UpW31GWmvaYPLeRgk8h/fP2Xxpb7NbXwbMdeE2mlpigdkN28sjoeX+F2tepsu6XMx24OY0vY5p4tcBzWMrVH1qrNVF6GOxwkZHnLnEcHDj095XPJs3v7Op6yf0QKrzadabdpQ2WcPMbkjseo/K9K1J6tRT2CIikBERARERAEREAXzI9rGOe9wa1oySegX0uN4onMdBsDHBr7DxGCeQ9VzdemdJS14Z2TU6k2oWJ7FNtiOWQCMvy1zGjOSDjh+ei6Oi+Hq1ymbWpQ5lmeXsBPFrP5R+/3Xk1CpJ5FfTnxVJ2ShscEzQC7aMc/RbGGIRQsjGcMaGjPoqeOdfuO6eLofZAPArDzE6DbsRGnC95f5kE0wJGzlj7cPXmtyuN4hjkYyK7Cxj5ICcNfyOVPPOzq+CON48PP4Pma2kartzZGkvDXN2/KccvfVaJY99vydShsS3opbDi3eyNuGsZ9evPr3C14OQp4a1Z4FrroREVxwEREAREQBERAFirk7NZ1ObfebA2P5KoeTtJ5E8PfFaTW77aVNwDS+aXLImA8XOKyEFqcRHSPIifKSWxiQAPa8niR9Bn8LPzV1UlkL5Ot4RpDzZ7Eh3+Q8xREfpzx3OH1ytUvJpdJun0IazDnYPmPd3U/letWxPpWHFPWF8yMa9hY9oc0jBB6r6VXZBh2VKtS/ZgusmkcxxEMLG58xp5cfTPviu14emnge/TrTHNLG+ZDu57O324flfvrdGaTbdouDLUAJbnk8Y5LOU47lZr9VfYawtOxnmkF0nHi331+yxfav8Auxd9SNyEXl067Heqtmj+jhnkV6lsTTWopzAiIpAREQBQkNBJOAOZKq4XiSzI7ydOrPayWxzc44DW+q5qvStJS1nJvX6F7Wnus23RwRYZBKzkH5xnP3P5Xs0SKa9qXxFiYWI6mWRTbcbz399guVYpRzyQUnUHQXo3BowRseMEb/r6/VbapWiqV2QwMDI2jAAVES6essp4sR+yIi0lQVUVQEKzOtUxp87r8NZsrQ04B5Md3I6haZfMrGyMcx43NcMEHqFXycatHU1hjtJu34Ip9QMbTC5/8Xd8oc7J/T7PMeuNVQuw3oBNA7I5EHm09isxcqP0mww2hLY06Pc6Jufla7s7099wvy027ce+3dqtjiw0Pl3j+G70Hrz69Vni3DxllSq6m1RcmhrkU38O4z4WbGcPPyuHcFe+K3XmOI54nk9GvBWqbmuzKnLR+6Lz2Ltat/zzsYexPH8Lk6hqtiy41tIbvk8svLz8vLoM9VFciQSbPbrF59djIKo3W5uEY7eqyGoQebXBEr2Xo3kTRSn5pM/0/v6eiWInz06lujPidxxLl2XNkHPHcceC1WnaXIJhc1JzJbewNBa3AaB798MUPeRlq9qJoOlirCyxZLpLUjBuc/8AkGP0j/z7LroOSLSliwqb0IiqkgiqiqAiIiALh6joj3CQ0ZNrZHbnwE/K4ruIualV3JTwxN5l06nDLqMLIqm4Da75mNaOy/Ob4fOpTxMJxIz4djX9OpA7fX1W5cA4YIBB6FeZ2n03ODnVYSR/0CpfB+Sxchj61mGXS/NwG3GzAjOQXjnx6df7L9odMvXNYkuVHOhg3+YwyN24PDhj7fTutgIIg/eImB39QaMr9EXD5ZDvwc6hpUVZ5mlIlsOJcZCORPZdJRFekl2OG9CIikgKoogCqiqAiIiAIiIAiIgKoiqAiIqUBFVEQBVRVARVRVARFVEAREQBERAXooioQEVKIUBERVARVEQH/9k=',
                  productModel: 'Accessories',
                  productName: 'NECKLACE',
                  productPrice: 1080,
                ),
                ShowAllWidget(
                  leftText: "History",
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: sigleProductData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 1.5),
                    itemBuilder: (context, index) {
                      var data = sigleProductData[index];
                      return SingleProductWidget(
                        onPressed: () {},
                        productImage: data.productFourImage,
                        productModel: data.productModel,
                        productPrice: data.productPrice,
                        productName: data.productName,
                        productOldPrice: data.productOldPrice,
                      );
                    },
                  ),
                ),
              ],
            ), //All

            //Shoes

            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildAdvertisementPlace(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrival",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Show All",
                        style: TextStyle(
                          color: AppColors.baseDarkPinkColor,
                          fontFamily: 'Lato',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: shoesData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      var data = shoesData[index];
                      return SingleProductWidget(
                        onPressed: () {},
                        productImage: data.productFourImage,
                        productModel: data.productModel,
                        productPrice: data.productPrice,
                        productName: data.productName,
                        productOldPrice: data.productOldPrice,
                      );
                    },
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                ShowAllWidget(
                  leftText: "History",
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: sigleProductData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 1.5),
                    itemBuilder: (context, index) {
                      var data = sigleProductData[index];
                      return SingleProductWidget(
                        onPressed: () {},
                        productImage: data.productFourImage,
                        productModel: data.productModel,
                        productPrice: data.productPrice,
                        productName: data.productName,
                        productOldPrice: data.productOldPrice,
                      );
                    },
                  ),
                ),
              ],
            ),

            //Clothes
            TabBatBar(
              productData: colothsData,
            ),

            //Accessories
            TabBatBar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }
}
