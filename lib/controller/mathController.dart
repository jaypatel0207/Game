import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/screens/resultscreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MathController extends GetxController {
  final Random _random = Random();
  var num1 = 0.obs;
  var num2 = 0.obs;
  var userAnswer = ''.obs;
  var correctCount = 0.obs;
  var wrongCount = 0.obs;
  var currentQuestion = 1.obs;
  var totalQuestions = 10.obs;

  @override
  void onInit() {
    super.onInit();
    generateNewQuestion();
  }

  void generateNewQuestion() {
    num1.value = _random.nextInt(50);
    num2.value = _random.nextInt(50);
    userAnswer.value = '';
  }

  void addNumber(String number) {
    if (userAnswer.value.length < 3) {
      userAnswer.value += number;
    }
  }

  void deleteNumber() {
    if (userAnswer.value.isNotEmpty) {
      userAnswer.value = userAnswer.value.substring(0, userAnswer.value.length - 1);
    }
  }

  void checkAnswer() {
    int correctAnswer = num1.value + num2.value;
    int? userAnswerNum = int.tryParse(userAnswer.value);

    if (userAnswerNum != null) {
      if (userAnswerNum == correctAnswer) {
        correctCount++;
        Get.defaultDialog(
          title: 'wow'.tr,
          middleText: 'correctanswer'.tr,
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
              proceedToNextQuestion();
            },
            child: Text('next'.tr),
          ),
        );
      } else {
        wrongCount++;
        Get.defaultDialog(
          title: 'sorry'.tr,
          middleText: "wrongAnswer! Correct answer was".tr + ":" + '$correctAnswer',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
              proceedToNextQuestion();
            },
            child: Text('trynext'.tr),
          ),
        );
      }
    }
  }

  void proceedToNextQuestion() {
    if (currentQuestion.value < totalQuestions.value) {
      currentQuestion++;
      generateNewQuestion();
    } else {
      Get.off(() => Resultscreen());
    }
  }

  void resetGame() {
    correctCount.value = 0;
    wrongCount.value = 0;
    currentQuestion.value = 1;
    generateNewQuestion();
  }
}