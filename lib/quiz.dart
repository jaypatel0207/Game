import 'package:flutter/material.dart';
import 'package:game/controller/quizController.dart';
import 'package:get/get.dart';
import 'dart:math';

void main() {
  runApp(GetMaterialApp(
    home: const MathQuizApp(),
    theme: ThemeData.dark(),
  ));
}

// Define the MathController first
class MathController extends GetxController {
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
    num1.value = Random().nextInt(50);
    num2.value = Random().nextInt(50);
    int correctAnswer = num1.value + num2.value;

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
          title: const Text('Great!'),
          content: const Text('Correct Answer!'),
          actions: [
            TextButton(
              child: const Text('Next'),
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
          title: const Text('Wrong Answer'),
          content: Text('The correct answer was ${num1.value + num2.value}'),
          actions: [
            TextButton(
              child: const Text('Try Next'),
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
        title: const Text('Quiz Completed!'),
        content: Text('Correct: $correctAnswers\nWrong: $wrongAnswers'),
        actions: [
          TextButton(
            child: const Text('Restart'),
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

// MathQuizApp widget
class MathQuizApp extends StatelessWidget {
  const MathQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final MathController controller = Get.put(MathController());
    final QuizController _controller = Get.put(QuizController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Progress and scores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  Obx(() => Text('${controller.currentQuestion} / 10')),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),

              // Score tracking
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(() => Text('${controller.wrongAnswers}')),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.edit),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(() => Text('${controller.correctAnswers}')),
                    ),
                  ],
                ),
              ),

              // Question
              Expanded(
                child: Center(
                  child: Obx(() => Text(
                        '${controller.num1} + ${controller.num2}',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      )),
                ),
              ),

              // Question mark container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  '?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),

              // Options
              Obx(() => GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    children: controller.options.map((option) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: [
                            Colors.amber,
                            Colors.teal,
                            Colors.blue,
                            Colors.pink
                          ][controller.options.indexOf(option)],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '$option',
                          style: const TextStyle(fontSize: 24),
                        ),
                        onPressed: () => controller.checkAnswer(option),
                      );
                    }).toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
