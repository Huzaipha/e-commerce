// ignore_for_file: unused_import, prefer_const_constructors

import 'package:first/appColors/app_colors.dart';
import 'package:first/screens/detailscreen/detail_screen.dart';
import 'package:first/screens/homapage/home_page.dart';
import 'package:first/screens/loginScreen/login_screen.dart';
import 'package:first/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import 'models/SingleProductModel.dart';
import 'mybottombar/my_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galaxy',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
          color: AppColors.baseBlackColor,
        )),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(
        title: '',
      ),
    );
  }
}
