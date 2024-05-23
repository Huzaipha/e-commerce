// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first/appColors/app_colors.dart';
import 'package:first/svgimages/svg_images.dart';
import 'package:first/widgets/my_button_widget.dart';
import 'package:first/widgets/my_textfromfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../stylies/signup_screen_stylies.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required String title});

  Widget buildToppart() {
    return Column(
      children: [
        Image.asset(
          "images/download.png",
          height: 60,
          width: 150,
        ),
        MyTextFromField(hintText: "Full Name", obscureText: false),
        MyTextFromField(hintText: "Email", obscureText: false),
        MyTextFromField(hintText: "Password", obscureText: true),
        MyTextFromField(hintText: "Confirm Password", obscureText: true),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MyButtonWidget(
              color: AppColors.baseDarkPinkColor,
              onPress: () {},
              text: "Create an Account"),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: "By Signing up you agree to our\n\t",
            style: SignupScreenStylies.signInAgressStyle,
            children: <TextSpan>[
              TextSpan(
                text: "Terms\t",
                style: SignupScreenStylies.termTextStyle,
              ),
              TextSpan(
                text: "and\t",
                style: SignupScreenStylies.andTextStyle,
              ),
              TextSpan(
                text: "Condition of use\t",
                style: SignupScreenStylies.conditionOfUseTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSocialButton({Widget? child, Function? onpressed}) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: AppColors.baseLightGreenColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {},
      child: child,
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'or signin with social networks',
            style: SignupScreenStylies.signInSocialStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //facebook
                buildSocialButton(
                  onpressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),

                //twitter
                buildSocialButton(
                  onpressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),

                //google
                buildSocialButton(
                  onpressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: MaterialButton(
              color: AppColors.baseLightOrangeColor,
              height: 30,
              elevation: 0,
              onPressed: () {},
              child: Center(
                child: Text(
                  "Sign Up",
                  style: SignupScreenStylies.signUpBottonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              buildToppart(),
              buildBottomPart(),
            ],
          ),
        ));
  }
}
