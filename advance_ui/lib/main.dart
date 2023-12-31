import 'package:advance_ui/controller/dateTime_Controller.dart';
import 'package:advance_ui/controller/platform_controller.dart';
import 'package:advance_ui/views/screens/android_HomePage.dart';
import 'package:advance_ui/views/screens/iOS_HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => platformcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => dateTimecontroller(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<platformcontroller>(context).isandroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: const androidHomePage(),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: iOSHomePage(),
          );
  }
}
