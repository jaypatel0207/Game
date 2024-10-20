import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/LocalStrim.dart';
//import 'package:game/quiz.dart';
import 'package:game/screens/home.dart';
import 'package:game/test.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('en', 'US'), 
          translations: LocalString(),
      
          
          home: child,
        );
      },
      child:  Home(),
    );
  }
}

