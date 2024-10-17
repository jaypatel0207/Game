import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/controller/settingController.dart';
import 'package:game/screens/content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SettingsController controller = Get.put(SettingsController());

  void _showCustomePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 2 - 175,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 230,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 145, 162, 1),
                    border: Border.all(
                        width: 6, color: Color.fromRGBO(255, 255, 255, 0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        height: 60.h,
                        width: 310.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _showsettingpopup(context);
                            },
                            child: ListTile(
                                leading:
                                    Icon(Icons.settings, color: Colors.black),
                                title: Text(
                                  "setting".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _showLanguagepopup(context);
                        },
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                                leading: SvgPicture.asset(
                                    "assets/images/translate.svg"),
                                title: Text(
                                  "language".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showsettingpopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 2 - 175,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 465,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 118, 75, 1),
                    border: Border.all(
                        width: 6, color: Color.fromRGBO(255, 255, 255, 0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "setting".tr,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                              leading: SvgPicture.asset(
                                "assets/images/music.svg",
                              ),
                              title: Text(
                                "music".tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                              trailing: Switch(
                                value: controller.isMusicOn.value,
                                onChanged: (value) => controller.toggleMusic(),
                              ),
                              //
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                              leading:
                                  SvgPicture.asset("assets/images/volume.svg"),
                              title: Text(
                                "sound".tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                              trailing: Switch(
                                value: controller.isSoundOn.value,
                                onChanged: (value) => controller.toggleSound(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                              leading:
                                  SvgPicture.asset("assets/images/moon.svg"),
                              title: Text(
                                "nightMode".tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                              trailing: Switch(
                                value: controller.isNightModeOn.value,
                                onChanged: (value) =>
                                    controller.toggleNightMode(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                                leading:
                                    SvgPicture.asset("assets/images/rate.svg"),
                                title: Text(
                                  "rateUs".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                            child: ListTile(
                                leading:
                                    SvgPicture.asset("assets/images/share.svg"),
                                title: Text(
                                  "shareapp".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showLanguagepopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 2 - 175,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 315,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(160, 213, 183, 1),
                    border: Border.all(
                        width: 6, color: Color.fromRGBO(255, 255, 255, 0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "language".tr,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: GestureDetector(
                          onTap: () {
                            var locale = Locale('en', 'US');
                            Get.updateLocale(locale);
                            Get.back();
                          },
                          child: Container(
                            height: 60.h,
                            width: 310.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "English",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: GestureDetector( 
                          onTap: () {
                              var locale = Locale('hi', 'IN');
                            Get.updateLocale(locale);
                            Get.back();
                          },
                          child: Container(
                            height: 60.h,
                            width: 310.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Hindi",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 13),
                        child: GestureDetector( 
                           onTap: () {
                               var locale = Locale('guj', 'IN');
                            Get.updateLocale(locale);
                            Get.back();
                           },
                          child: Container(
                            height: 60.h,
                            width: 310.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Gujarati",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                      ),
                     
                     
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: [
        Image.asset(
          "assets/images/Home.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
            child: Column(
          children: [
            SizedBox(height: 60.h),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showCustomePopup(context);
                    },
                    child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 4,
                                color: Color.fromRGBO(255, 255, 255, 0.3)),
                            color: Color.fromRGBO(255, 145, 162, 1)),
                        child: Image.asset("assets/images/Group.png")),
                  ),
                  SizedBox(
                    width: 65.w,
                  ),
                  Container(
                    height: 52.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(255, 255, 255, 0.3)),
                        color: Color.fromRGBO(241, 191, 94, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/diamond.svg",
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 65.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(156, 186, 255, 1),
                        border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(255, 255, 255, 0.3))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Text(
              "playgame".tr,
              style: TextStyle(
                  fontFamily: 'Knewave',
                  fontSize: 52,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 90.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector( 
                  onTap: () {
                    Get.to(() => Content(
                      title: "Addition", 
                      operation: "plus",
                    ));
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                        color: Color.fromRGBO(241, 191, 94, 1)),
                    child: Image.asset("assets/images/Plus.png"),
                  ),
                ),
                GestureDetector( 
                onTap: () {
                    Get.to(() => Content(
                       title: "Substraction", 
                      operation: "minus",
                    ));
                },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                        color: Color.fromRGBO(160, 213, 183, 1)),
                    child: Image.asset("assets/images/minus.png"),
                  ),
                ),
                GestureDetector( 
                  onTap: () {
                      Get.to(() => Content(
                      title: "Multiplication", 
                      operation: "multiply",
                    ));
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                        color: Color.fromRGBO(239, 118, 75, 1)),
                    child: Image.asset("assets/images/multi.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                      Get.to(() => Content(
                       title: "Division", 
                      operation: "divide",
                    ));
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                        color: Color.fromRGBO(156, 186, 255, 1)),
                    child: Image.asset("assets/images/divide.png"),
                  ),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                      color: Color.fromRGBO(255, 145, 162, 1)),
                  child: Image.asset("assets/images/root.png"),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5, color: Color.fromRGBO(255, 255, 255, 1)),
                        color: Color.fromRGBO(241, 191, 94, 1),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/Game.png"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(239, 118, 75, 1),
                          border: Border.all(
                            width: 3,
                            color: Color.fromRGBO(248, 223, 174, 1),
                          ),
                        ),
                        child: Center(
                            child: Image.asset("assets/images/daimond.png")),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ))
      ]),
    ));
  }
}
















































