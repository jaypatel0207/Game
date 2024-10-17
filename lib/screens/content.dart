import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/controller/checkboxController.dart';
import 'package:get/get.dart';

class Content extends StatefulWidget {
  final String operation;
  final String title;
  const Content({super.key, required this.operation, required this.title});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final CheckboxController checkboxController = Get.put(CheckboxController());
  void _showsettingPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          Center(
            child: Positioned(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 350.w,
                  height: 440.h,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 191, 94, 1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 6, color: Color.fromRGBO(255, 255, 255, 0.3))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: 310.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(255, 255, 255, 0.8))),
                          child: Obx(() => CheckboxListTile(
                                title: const Text('Easy',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                value: checkboxController.isEasyChecked.value,

                                checkColor: Color.fromRGBO(15, 193, 33, 1),
                                activeColor: Colors.white,

                                onChanged: (value) {
                                  checkboxController.isEasyChecked.value =
                                      value ?? false;
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, // Checkbox on the left
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: 310.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(255, 255, 255, 0.8))),
                          child: Obx(() => CheckboxListTile(
                                checkColor: Color.fromRGBO(15, 193, 33, 1),
                                activeColor: Colors.white,
                                title: const Text('Medium',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                value: checkboxController.isMediumChecked.value,
                                onChanged: (value) {
                                  checkboxController.isMediumChecked.value =
                                      value ?? false;
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, // Checkbox on the left
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: 310.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(255, 255, 255, 0.8))),
                          child: Obx(() => CheckboxListTile(
                                checkColor: Color.fromRGBO(15, 193, 33, 1),
                                activeColor: Colors.white,
                                title: Text('Hard',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                value: checkboxController.isHardChecked.value,
                                onChanged: (value) {
                                  checkboxController.isHardChecked.value =
                                      value ?? false;
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, // Checkbox on the left
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Row(
                          children: [
                            Text(
                              "Questions : ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => Row(
                                children: [
                                  Radio<int>(
                                    activeColor: Colors.white,
                                    value: 10,
                                    groupValue: checkboxController
                                        .selectedQuestionCount.value,
                                    onChanged: (value) {
                                      checkboxController.selectedQuestionCount
                                          .value = value ?? 10;
                                    },
                                  ),
                                  const Text(
                                    '10',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Obx(() => Row(
                                children: [
                                  Radio<int>(
                                    activeColor: Colors.white,
                                    value: 20,
                                    groupValue: checkboxController
                                        .selectedQuestionCount.value,
                                    onChanged: (value) {
                                      checkboxController.selectedQuestionCount
                                          .value = value ?? 20;
                                    },
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Obx(() => Row(
                                children: [
                                  Radio<int>(
                                    activeColor: Colors.white,
                                    value: 30,
                                    groupValue: checkboxController
                                        .selectedQuestionCount.value,
                                    onChanged: (value) {
                                      checkboxController.selectedQuestionCount
                                          .value = value ?? 30;
                                    },
                                  ),
                                  Text(
                                    '30',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      GestureDetector(
                        onTap: () {
                         Get.back();
                          String selectedLevels = '';
                          if (checkboxController.isEasyChecked.value)
                            selectedLevels += 'Easy ';
                          if (checkboxController.isMediumChecked.value)
                            selectedLevels += 'Medium ';
                          if (checkboxController.isHardChecked.value)
                            selectedLevels += 'Hard ';
                          int selectedQuestions =
                              checkboxController.selectedQuestionCount.value;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Selected Options'),
                                content: Text(
                                    'Levels: ${selectedLevels.isEmpty ? 'None' : selectedLevels}\nQuestions: $selectedQuestions'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );

                        },
                        child: Container(
                          height: 60.h,
                          width: 310.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            "OK",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(241, 191, 94, 1)),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.operation == "plus"
          ?

          //Addition Page
          Stack(
              children: [
                Image.asset(
                  "assets/images/Home.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 4,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.3)),
                                color: const Color.fromRGBO(255, 145, 162, 1)),
                            child: SvgPicture.asset("assets/images/Back.svg",
                                height: 25, width: 25, fit: BoxFit.scaleDown),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 216.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 4,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.3)),
                              color: const Color.fromRGBO(156, 186, 255, 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/play.svg"),
                              SizedBox(
                                width: 13.w,
                              ),
                               Text(
                                'additions'.tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showsettingPopUp(context);
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 4,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.3)),
                                color: const Color.fromRGBO(241, 191, 94, 1)),
                            child: SvgPicture.asset("assets/images/Setting.svg",
                                height: 26, width: 26, fit: BoxFit.scaleDown),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(241, 191, 94, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/Practice.svg"),
                              SizedBox(
                                height: 5.h,
                              ),
                               Text(
                                'practice'.tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(160, 213, 183, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/quiz.svg"),
                              SizedBox(
                                height: 5.h,
                              ),
                               Text(
                                'quiz'.tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(239, 118, 75, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/duel.svg"),
                               Text(
                                'duel'.tr,
                                style:const  TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(156, 186, 255, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset(
                                "assets/images/play1.svg",
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                               Text(
                                'play'.tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(255, 145, 162, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/test.svg"),
                               Text(
                                'test'.tr,
                                style: const  TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(241, 191, 94, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              SvgPicture.asset("assets/images/time.svg"),
                              SizedBox(
                                height: 5.h,
                              ),
                               Text(
                                "time".tr,
                                style: const  TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(160, 213, 183, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/learn.svg"),
                              SizedBox(
                                height: 5.h,
                              ),
                               Text(
                                "learn".tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(239, 118, 75, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/hard.svg"),
                              SizedBox(
                                height: 5.h,
                              ),
                               Text(
                                "hard".tr,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(156, 186, 255, 1),
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SvgPicture.asset("assets/images/math.svg"),
                              SizedBox(
                                height: 7.h,
                              ),
                               Text(
                                "match".tr,
                                style:const  TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(239, 118, 75, 1),
                                border: Border.all(
                                    width: 4,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 7.h,
                                ),
                                SvgPicture.asset("assets/images/recall.svg"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                 Text(
                                  "recall".tr,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            )

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------////
          //substraction Page

          : widget.operation == "minus"
              ? Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                )

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------////

              //multily Page

              : widget.operation == "multiply"
                  ? Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    )

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------////

                  //divide Page

                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple,
                    ),

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------////
    );
  }
}
