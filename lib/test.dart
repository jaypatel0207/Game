// // bindings/operation_binding.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OperationBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<OperationController>(() => OperationController());
//   }
// }

// // main.dart

// void main() {
//   runApp(const MathGame());
// }

// class MathGame extends StatelessWidget {
//   const MathGame({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       initialBinding: OperationBinding(),
//       getPages: [
//         GetPage(
//           name: '/',
//           page: () => const HomePage(),
//           binding: OperationBinding(),
//         ),
//         GetPage(
//           name: '/addition',
//           page: () => const OperationPage(operation: 'Addition'),
//           binding: OperationBinding(),
//         ),
//         GetPage(
//           name: '/subtraction',
//           page: () => const OperationPage(operation: 'Subtraction'),
//           binding: OperationBinding(),
//         ),
//         GetPage(
//           name: '/multiplication',
//           page: () => const OperationPage(operation: 'Multiplication'),
//           binding: OperationBinding(),
//         ),
//         GetPage(
//           name: '/division',
//           page: () => const OperationPage(operation: 'Division'),
//           binding: OperationBinding(),
//         ),
//       ],
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color(0xFF1A1B2E),
//       ),
//     );
//   }
// }

// // controllers/operation_controller.dart
// class OperationController extends GetxController {
//   final RxInt score = 0.obs;
//   final RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     ever(score, (_) => update()); // Update UI whenever score changes
//   }

//   @override
//   void onClose() {
//     score.close();
//     isLoading.close();
//     super.onClose();
//   }

//   void incrementScore() {
//     score.value++;
//   }

//   void resetScore() {
//     score.value = 0;
//   }

//   Map<String, dynamic> getOperationDetails(String operation) {
//     switch (operation) {
//       case 'Addition':
//         return {
//           'icon': '+',
//           'color': Colors.orange,
//           'description': 'Practice adding numbers',
//         };
//       case 'Subtraction':
//         return {
//           'icon': '-',
//           'color': Colors.green,
//           'description': 'Practice subtracting numbers',
//         };
//       case 'Multiplication':
//         return {
//           'icon': '×',
//           'color': Colors.red,
//           'description': 'Practice multiplying numbers',
//         };
//       case 'Division':
//         return {
//           'icon': '÷',
//           'color': Colors.blue,
//           'description': 'Practice dividing numbers',
//         };
//       default:
//         return {
//           'icon': '?',
//           'color': Colors.grey,
//           'description': 'Unknown operation',
//         };
//     }
//   }
// }

// // views/home_page.dart
// class HomePage extends GetView<OperationController> {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Play Game',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 3,
//           mainAxisSpacing: 16.0,
//           crossAxisSpacing: 16.0,
//           children: [
//             _buildOperationButton(
//               operation: 'Addition',
//               route: '/addition',
//             ),
//             _buildOperationButton(
//               operation: 'Subtraction',
//               route: '/subtraction',
//             ),
//             _buildOperationButton(
//               operation: 'Multiplication',
//               route: '/multiplication',
//             ),
//             _buildOperationButton(
//               operation: 'Division',
//               route: '/division',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOperationButton({
//     required String operation,
//     required String route,
//   }) {
//     final details = controller.getOperationDetails(operation);
//     return GestureDetector(
//       onTap: () => Get.toNamed(route),
//       child: Container(
//         decoration: BoxDecoration(
//           color: details['color'],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//           child: Text(
//             details['icon'],
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // views/operation_page.dart
// class OperationPage extends GetView<OperationController> {
//   final String operation;

//   const OperationPage({
//     Key? key,
//     required this.operation,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final details = controller.getOperationDetails(operation);

//     return WillPopScope(
//       onWillPop: () async {
//         Get.delete<OperationController>();
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Get.delete<OperationController>();
//               Get.back();
//             },
//           ),
//           title: Text(
//             operation,
//             style: const TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Practice $operation',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: details['color'].withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 64,
//                       height: 64,
//                       decoration: BoxDecoration(
//                         color: details['color'],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Text(
//                           details['icon'],
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       details['description'],
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     GetBuilder<OperationController>(
//                       builder: (ctrl) => Text(
//                         'Score: ${ctrl.score.value}',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: controller.incrementScore,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: details['color'],
//                       ),
//                       child: const Text('Increment Score'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Math Game',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Math Game")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Navigate to the New Page with "+" content
//                 Get.to(() => NewPage(
//                       title: "Plus Page",
//                       content: "+",
//                       isPlus: true,
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.blue,
//                 child: Text("+", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Navigate to the New Page with "-" content
//                 Get.to(() => NewPage(
//                       title: "Minus Page",
//                       content: "-", // This will be ignored for container display
//                       isPlus: false,
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.red,
//                 child: Text("-", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NewPage extends StatelessWidget {
//   final String title;
//   final String content;
//   final bool isPlus;

//   NewPage({required this.title, required this.content, required this.isPlus});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(
//         child: isPlus
//             ? Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.orange,
//                 child: Center(
//                   child: Text(
//                     content,
//                     style: TextStyle(fontSize: 50),
//                   ),
//                 ),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.green,
//                     child: Center(
//                       child: Text(
//                         "1",
//                         style: TextStyle(fontSize: 50),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20), // Space between containers
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(
//                         "2",
//                         style: TextStyle(fontSize: 50),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20), // Space between containers
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.orange,
//                     child: Center(
//                       child: Text(
//                         "3",
//                         style: TextStyle(fontSize: 50),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Math Game',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Math Game")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // "+" Container
//             GestureDetector(
//               onTap: () {
//                 Get.to(() => NewPage(
//                       title: "Plus Page",
//                       content: "+",
//                       operation: "plus",
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.blue,
//                 child: Text("+", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//             // "-" Container
//             GestureDetector(
//               onTap: () {
//                 Get.to(() => NewPage(
//                       title: "Minus Page",
//                       content: "-", // This will be ignored for container display
//                       operation: "minus",
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.red,
//                 child: Text("-", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//             // "*" Container
//             GestureDetector(
//               onTap: () {
//                 Get.to(() => NewPage(
//                       title: "Multiply Page",
//                       content: "*",
//                       operation: "multiply",
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.green,
//                 child: Text("*", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//             // "/" Container
//             GestureDetector(
//               onTap: () {
//                 Get.to(() => NewPage(
//                       title: "Divide Page",
//                       content: "/",
//                       operation: "divide",
//                     ));
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.orange,
//                 child: Text("/", style: TextStyle(fontSize: 40, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NewPage extends StatelessWidget {
//   final String title;
//   final String content;
//   final String operation;

//   NewPage({required this.title, required this.content, required this.operation});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(
//         child: operation == "plus"
//             ? Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.orange,
//                 child: Center(
//                   child: Text(
//                     content,
//                     style: TextStyle(fontSize: 50),
//                   ),
//                 ),
//               )
//             : operation == "minus"
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.green,
//                         child: Center(
//                           child: Text("1", style: TextStyle(fontSize: 50)),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.blue,
//                         child: Center(
//                           child: Text("2", style: TextStyle(fontSize: 50)),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.orange,
//                         child: Center(
//                           child: Text("3", style: TextStyle(fontSize: 50)),
//                         ),
//                       ),
//                     ],
//                   )
//                 : operation == "multiply"
//                     ? Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.purple,
//                         child: Center(
//                           child: Text("Multiplication", style: TextStyle(fontSize: 20)),
//                         ),
//                       )
//                     : Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.brown,
//                         child: Center(
//                           child: Text("Division", style: TextStyle(fontSize: 20)),
//                         ),
//                       ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:game/controller/checkboxController.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Checkbox and Radio Button Example with GetX',
//       home: CheckboxPage(),
//     );
//   }
// }

// class CheckboxPage extends StatelessWidget {
//   // Instantiate the CheckboxController
//   final CheckboxController checkboxController = Get.put(CheckboxController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Difficulty Levels and Questions'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Checkboxes for selecting difficulty levels
//             Obx(() => CheckboxListTile(
//                   title: Text('Easy'),
//                   value: checkboxController.isEasyChecked.value,
//                   onChanged: (value) {
//                     checkboxController.isEasyChecked.value = value ?? false;
//                   },
//                   controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
//                 )),
//             Obx(() => CheckboxListTile(
//                   title: Text('Medium'),
//                   value: checkboxController.isMediumChecked.value,
//                   onChanged: (value) {
//                     checkboxController.isMediumChecked.value = value ?? false;
//                   },
//                   controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
//                 )),
//             Obx(() => CheckboxListTile(
//                   title: Text('Hard'),
//                   value: checkboxController.isHardChecked.value,
//                   onChanged: (value) {
//                     checkboxController.isHardChecked.value = value ?? false;
//                   },
//                   controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
//                 )),

//             SizedBox(height: 20),

//             // Radio buttons for selecting number of questions
//             Text(
//               'Questions:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // Radio button for 10 questions
//                 Obx(() => Row(
//                       children: [
//                         Radio<int>(
//                           value: 10,
//                           groupValue: checkboxController.selectedQuestionCount.value,
//                           onChanged: (value) {
//                             checkboxController.selectedQuestionCount.value = value ?? 10;
//                           },
//                         ),
//                         Text('10'),
//                       ],
//                     )),
//           SizedBox(width: 10.w,),
//                 Obx(() => Row(
//                       children: [
//                         Radio<int>(
//                           value: 20,
//                           groupValue: checkboxController.selectedQuestionCount.value,
//                           onChanged: (value) {
//                             checkboxController.selectedQuestionCount.value = value ?? 20;
//                           },
//                         ),
//                         Text('20'),
//                       ],
//                     )),
//                  SizedBox(width: 10.w,),
//                 Obx(() => Row(
//                       children: [
//                         Radio<int>(
//                           value: 30,
//                           groupValue: checkboxController.selectedQuestionCount.value,
//                           onChanged: (value) {
//                             checkboxController.selectedQuestionCount.value = value ?? 30;
//                           },
//                         ),
//                         Text('30'),
//                       ],
//                     )),
//               ],
//             ),

//             SizedBox(height: 20),

//             // Submit button to show selected options
//             ElevatedButton(
//               onPressed: () {
//                 // Show selected options
//                 String selectedLevels = '';
//                 if (checkboxController.isEasyChecked.value) selectedLevels += 'Easy ';
//                 if (checkboxController.isMediumChecked.value) selectedLevels += 'Medium ';
//                 if (checkboxController.isHardChecked.value) selectedLevels += 'Hard ';
//                 int selectedQuestions = checkboxController.selectedQuestionCount.value;

//                 // Show a dialog with the selected options
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Selected Options'),
//                       content: Text(
//                           'Levels: ${selectedLevels.isEmpty ? 'None' : selectedLevels}\nQuestions: $selectedQuestions'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// math_controller.dart
// lib/main.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/screens/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Math Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MathGameScreen(),
    );
  }
}

// lib/controllers/math_controller.dart

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
      userAnswer.value =
          userAnswer.value.substring(0, userAnswer.value.length - 1);
    }
  }

  void checkAnswer() {
    int correctAnswer = num1.value + num2.value;
    int? userAnswerNum = int.tryParse(userAnswer.value);

    if (userAnswerNum != null) {
      if (userAnswerNum == correctAnswer) {
        correctCount++;
        Get.defaultDialog(
          title: 'Wow!',
          middleText: 'Correct Answer!',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
              proceedToNextQuestion();
            },
            child: Text('Next'),
          ),
        );
      } else {
        wrongCount++;
        Get.defaultDialog(
          title: 'Sorry!',
          middleText: 'Wrong Answer! Correct answer was $correctAnswer',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
              proceedToNextQuestion();
            },
            child: Text('Try Next'),
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
      Get.off(() => ResultScreen());
    }
  }

  void resetGame() {
    correctCount.value = 0;
    wrongCount.value = 0;
    currentQuestion.value = 1;
    generateNewQuestion();
  }
}

// lib/screens/math_game_screen.dart

class MathGameScreen extends StatelessWidget {
  final MathController controller = Get.put(MathController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF1a1a2e),
          child: Column(
            children: [
              _buildHeader(),
              _buildScoreBoard(),
              _buildQuestionSection(),
              _buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.pink[100]),
            onPressed: () => Get.back(),
          ),
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${controller.currentQuestion} / ${controller.totalQuestions}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildScoreBoard() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() => Text(
                  '${controller.wrongCount}',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() => Text(
                  '${controller.correctCount}',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${controller.num1} + ${controller.num2}',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(() => Text(
                    controller.userAnswer.value.isEmpty
                        ? '?'
                        : controller.userAnswer.value,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
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
}

// lib/screens/result_screen.dart

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

                SizedBox(height: 25.h,), 
                ElevatedButton(
      onPressed: () {
       Get.to(Home());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Home',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    )





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
        Get.off(() => MathGameScreen());
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
          color: Colors.white
        ),
      ),
    );
  }
}

// lib/widgets/number_button.dart

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

// lib/widgets/delete_button.dart

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
            border:
                Border.all(width: 5, color: Color.fromRGBO(255, 255, 255, 0.5))),
                child: SvgPicture.asset("assets/images/delete.svg", 
                height: 40, 
                width: 40, 
                fit: BoxFit.scaleDown,
                
                ),
      ),
    );
  }
}

// lib/widgets/check_button.dart

class CheckButton extends StatelessWidget {
  final VoidCallback onTap;

  CheckButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector( 
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
            border:
                Border.all(width: 5, color: Color.fromRGBO(255, 255, 255, 0.5))),
                child: Icon(Icons.check_rounded, color: Colors.white,size: 45,)
      ),
    );
  }
}
