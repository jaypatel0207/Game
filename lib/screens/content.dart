import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/controller/checkboxController.dart';
import 'package:game/controller/mathController.dart';
import 'package:game/controller/quizController.dart';
import 'package:get/get.dart';

class Content extends StatefulWidget {
  final String operation;
  final String title;
  const Content({super.key, required this.operation, required this.title});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final MathController controller = Get.put(MathController());

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
                                title: Text('easy'.tr,
                                    style: const TextStyle(
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
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                                title: Text('medium'.tr,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                value: checkboxController.isMediumChecked.value,
                                onChanged: (value) {
                                  checkboxController.isMediumChecked.value =
                                      value ?? false;
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                                title: Text('hard'.tr,
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
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                            selectedLevels += 'easy '.tr;
                          if (checkboxController.isMediumChecked.value)
                            selectedLevels += 'medium '.tr;
                          if (checkboxController.isHardChecked.value)
                            selectedLevels += 'hard '.tr;
                          int selectedQuestions =
                              checkboxController.selectedQuestionCount.value;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('selectedOptions'.tr),
                                content: Text(
                                    'levels'.tr  +  ":" "${selectedLevels.isEmpty ? 'None' : selectedLevels}" + "\nQuestions".tr +":" "$selectedQuestions"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('ok'.tr),
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
                            "ok".tr,
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
                        GestureDetector(
                          onTap: () {
                            Get.to(_additionscreen());
                          },
                          child: Container(
                            height: 50.h,
                            width: 216.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 4,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.3)),
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
                        GestureDetector(
                          onTap: () {
                            controller.resetGame();
                            Get.to(_additionscreen());
                          },
                          child: Container(
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
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(_quiz());
                          },
                          child: Container(
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

Widget _additionscreen() {
  return Scaffold(
    body: Stack(
      children: [
        Image.asset("assets/images/Home.png",
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        Positioned.fill(
            child: Column(
          children: [
            SizedBox(height: 50.h),
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildScoreContainer(),
            SizedBox(height: 20.h),
            _buildQuestionSection(),
            _buildNumberPad(),
          ],
        ))
      ],
    ),
  );
}

Widget _buildHeader() {
  final MathController controller = Get.put(MathController());

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    width: 4, color: const Color.fromRGBO(255, 255, 255, 0.3)),
                color: const Color.fromRGBO(255, 145, 162, 1)),
            child: SvgPicture.asset("assets/images/Back.svg",
                height: 25, width: 25, fit: BoxFit.scaleDown),
          ),
        ),
        Obx(() => Container(
              height: 50.h,
              width: 155.w,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(156, 186, 255, 1),
                border: Border.all(
                    width: 4, color: Color.fromRGBO(255, 255, 255, 0.3)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '${controller.currentQuestion} / ${controller.totalQuestions}',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ))
      ],
    ),
  );
}

Widget _buildScoreContainer() {
  final MathController controller = Get.put(MathController());

  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(250, 38, 38, 1),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  width: 5, color: Color.fromRGBO(255, 255, 255, 0.3))),
          child: Obx(() => Center(
                child: Text(
                  '${controller.wrongCount}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
        ),
        Container(
          height: 60.h,
          width: 60.w,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(51, 195, 16, 1),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  width: 5, color: Color.fromRGBO(255, 255, 255, 0.3))),
          child: Obx(() => Center(
                child: Text(
                  '${controller.correctCount}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
        ),
      ],
    ),
  );
}

Widget _buildQuestionSection() {
  final MathController controller = Get.put(MathController());
  return Expanded(
    child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Obx(() => Text(
                '${controller.num1}   +   ${controller.num2}',
                style: TextStyle(
                  fontFamily: 'PoetsenOne',
                  fontSize: 55,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              )),
          SizedBox(height: 60.h),
          Container(
            height: 80.h,
            width: 210.w,
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 118, 75, 1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 5, color: Color.fromRGBO(255, 255, 255, 0.5))),
            child: Obx(() => Center(
                  child: Text(
                    controller.userAnswer.value.isEmpty
                        ? '?'
                        : controller.userAnswer.value,
                    style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      fontSize: 55,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}

Widget _buildNumberPad() {
  final MathController controller = Get.put(MathController());
  return Container(
    padding: EdgeInsets.all(16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        ...List.generate(
            9,
            (index) => NumberButton(
                  number: '${index + 1}',
                  onTap: () => controller.addNumber('${index + 1}'),
                )),
        NumberButton(
          number: '0',
          onTap: () => controller.addNumber('0'),
        ),
        DeleteButton(
          onTap: () => controller.deleteNumber(),
        ),
        CheckButton(
          onTap: () => controller.checkAnswer(),
        ),
      ],
    ),
  );
}

class NumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  NumberButton({required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(width: 5, color: Color.fromRGBO(255, 255, 255, 0.5)),
            color: getRandomColor()),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w400,
                fontFamily: 'PoetsenOne',
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    final colors = [
      Color.fromRGBO(241, 191, 94, 1),
      Color.fromRGBO(160, 213, 183, 1),
      Color.fromRGBO(239, 118, 75, 1),
      Color.fromRGBO(156, 186, 255, 1),
    ];

    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}

class DeleteButton extends StatelessWidget {
  final VoidCallback onTap;

  DeleteButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(156, 186, 255, 1),
            border: Border.all(
                width: 5, color: Color.fromRGBO(255, 255, 255, 0.5))),
        child: SvgPicture.asset(
          "assets/images/delete.svg",
          height: 40,
          width: 40,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  final VoidCallback onTap;

  CheckButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
              border: Border.all(
                  width: 5, color: Color.fromRGBO(255, 255, 255, 0.5))),
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 45,
          )),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final MathController controller = Get.find<MathController>();

  @override
  Widget build(BuildContext context) {
    int totalQuestions = controller.totalQuestions.value;
    double percentage = (controller.correctCount.value / totalQuestions) * 100;

    return Scaffold(
      body: Container(
        color: Color(0xFF1a1a2e),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quiz Completed!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                _buildScoreCard(totalQuestions, percentage),
                SizedBox(height: 40),
                _buildPlayAgainButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(int totalQuestions, double percentage) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildScoreRow(
            'Total Questions:',
            totalQuestions.toString(),
            Colors.blue[200]!,
          ),
          SizedBox(height: 20),
          _buildScoreRow(
            'Correct Answers:',
            controller.correctCount.value.toString(),
            Colors.green[300]!,
          ),
          SizedBox(height: 20),
          _buildScoreRow(
            'Wrong Answers:',
            controller.wrongCount.value.toString(),
            Colors.red[300]!,
          ),
          SizedBox(height: 20),
          _buildScoreRow(
            'Score Percentage:',
            '${percentage.toStringAsFixed(1)}%',
            Colors.purple[200]!,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayAgainButton() {
    return ElevatedButton(
      onPressed: () {
        controller.resetGame();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Play Again',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget _quiz() {
  final QuizController _controller = Get.put(QuizController());

  return Scaffold(
    body: Stack(
      children: [
        Image.asset("assets/images/Home.png",
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Positioned.fill(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: 170.h,
                  ),
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
                              color: const Color.fromRGBO(255, 255, 255, 0.3)),
                          color: const Color.fromRGBO(255, 145, 162, 1)),
                      child: SvgPicture.asset("assets/images/Back.svg",
                          height: 25, width: 25, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(
                    width: 48.w,
                  ),
                  Obx(
                    () => Container(
                      height: 50.h,
                      width: 155.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(156, 186, 255, 1),
                        border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(255, 255, 255, 0.3)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text('${_controller.currentQuestion} / 10',
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  _showsettingPopUp(context);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 4,
                              color: const Color.fromRGBO(255, 255, 255, 0.3)),
                          color: const Color.fromRGBO(241, 191, 94, 1)),
                      child: SvgPicture.asset("assets/images/Setting.svg",
                          height: 26, width: 26, fit: BoxFit.scaleDown),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 38, 38, 1),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            width: 5,
                            color: const Color.fromRGBO(255, 255, 255, 0.3))),
                    child: Obx(() => Center(
                          child: Text(
                            '${_controller.wrongAnswers}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 195, 16, 1),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            width: 5,
                            color: Color.fromRGBO(255, 255, 255, 0.3))),
                    child: Obx(() => Center(
                          child: Text(
                            '${_controller.correctAnswers}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Obx(() => Text(
                    '${_controller.num1}   +   ${_controller.num2}',
                    style: const TextStyle(
                        fontFamily: 'PoetsenOne',
                        fontSize: 55,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: 210.w,
                height: 80.h,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 118, 75, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 5, color: Color.fromRGBO(255, 255, 255, 0.3))),
                child: const Text(
                  '?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Obx(() => GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                  childAspectRatio: 165 / 80,
                  children: _controller.options.map((option) {
                    return GestureDetector(
                      onTap: () {
                        _controller.checkAnswer(option);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 8),
                        child: Container(
                          height: 80.h,
                          width: 165.w,
                          decoration: BoxDecoration(
                              color: [
                                Color.fromRGBO(241, 191, 94, 1),
                                Color.fromRGBO(160, 213, 183, 1),
                                Color.fromRGBO(156, 186, 255, 1),
                                Color.fromRGBO(255, 145, 162, 1)
                              ][_controller.options.indexOf(option)],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 5,
                                  color: Color.fromRGBO(255, 255, 255, 0.5))),
                          child: Center(
                            child: Text(
                              '$option',
                              style: const TextStyle(
                                  fontFamily: 'PoetsenOne',
                                  color: Colors.white,
                                  fontSize: 45),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ))
      ],
    ),
  );
}
