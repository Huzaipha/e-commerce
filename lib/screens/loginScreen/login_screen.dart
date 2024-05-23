// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:first/routes/routes.dart';
import 'package:first/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors/app_colors.dart';
import '../../stylies/login_screen_stylies.dart';
import '../../svgimages/svg_images.dart';
import '../../widgets/my_button_widget.dart';
import '../../widgets/my_textfromfield_widget.dart';
import '../homapage/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String title});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/download.png",
          height: 60,
          width: 150,
        ),
        Column(
          children: [
            MyTextFromField(
              hintText: 'E-mail',
              obscureText: false,
            ),
            MyTextFromField(
              hintText: 'Password',
              obscureText: true,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyButtonWidget(
                  color: AppColors.baseBlackColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                        context: context,
                        navigateTo: HomePage(
                          title: '',
                        ));
                  },
                  text: "Sign in",
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MyButtonWidget(
                color: AppColors.baseDarkPinkColor,
                onPress: () {
                  PageRouting.goToNextPage(
                      context: context,
                      navigateTo: SignupScreen(
                        title: '',
                      ));
                },
                text: "Sign up",
              )),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 30,
        ),
        // ignore: prefer_const_constructors
        Text(
          "Forgot Password?",
          style: LoginScreenStylies.forgotPasswordStylies,
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

  Widget buildBottomPart({required BuildContext context}) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'or signin with social networks',
            style: LoginScreenStylies.signinSocialStylies,
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
              height: 50,
              elevation: 0,
              onPressed: () {
                PageRouting.goToNextPage(
                    context: context,
                    navigateTo: SignupScreen(
                      title: '',
                    ));
              },
              child: Center(
                child: Text(
                  "Sign Up",
                  style: LoginScreenStylies.signUpButtonTextStylies,
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
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopPart(),
                  buildBottomPart(context: context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
