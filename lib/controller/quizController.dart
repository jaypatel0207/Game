import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  var correctAnswers = 0.obs;
  var wrongAnswers = 0.obs;
  var currentQuestion = 1.obs;
  var num1 = 0.obs;
  var num2 = 0.obs;
  var options = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    generateQuestion();
  }

  void generateQuestion() {
    // Generate random numbers
    num1.value = Random().nextInt(50);
    num2.value = Random().nextInt(50);
    int correctAnswer = num1.value + num2.value;

    // Generate options
    List<int> newOptions = [correctAnswer];
    while (newOptions.length < 4) {
      int option = Random().nextInt(100);
      if (!newOptions.contains(option)) {
        newOptions.add(option);
      }
    }
    newOptions.shuffle();
    options.value = newOptions;
  }

  void checkAnswer(int selected) {
    if (selected == num1.value + num2.value) {
      correctAnswers++;
      Get.dialog(
        AlertDialog(
          title: Text('Great!'),
          content: Text('Correct Answer!'),
          actions: [
            TextButton(
              child: Text('Next'),
              onPressed: () {
                Get.back();
                if (currentQuestion < 10) {
                  currentQuestion++;
                  generateQuestion();
                } else {
                  showFinalScore();
                }
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    } else {
      wrongAnswers++;
      Get.dialog(
        AlertDialog(
          title: Text('Wrong Answer'),
          content: Text('The correct answer was ${num1.value + num2.value}'),
          actions: [
            TextButton(
              child: Text('Try Next'),
              onPressed: () {
                Get.back();
                if (currentQuestion < 10) {
                  currentQuestion++;
                  generateQuestion();
                } else {
                  showFinalScore();
                }
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  void showFinalScore() {
    Get.dialog(
      AlertDialog(
        title: Text('Quiz Completed!'),
        content: Text('Correct: $correctAnswers\nWrong: $wrongAnswers'),
        actions: [
          TextButton(
            child: Text('Restart'),
            onPressed: () {
              Get.back();
              correctAnswers.value = 0;
              wrongAnswers.value = 0;
              currentQuestion.value = 1;
              generateQuestion();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
