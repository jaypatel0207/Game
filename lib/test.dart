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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/controller/checkboxController.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Checkbox and Radio Button Example with GetX',
      home: CheckboxPage(),
    );
  }
}


class CheckboxPage extends StatelessWidget {
  // Instantiate the CheckboxController
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Difficulty Levels and Questions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkboxes for selecting difficulty levels
            Obx(() => CheckboxListTile(
                  title: Text('Easy'),
                  value: checkboxController.isEasyChecked.value,
                  onChanged: (value) {
                    checkboxController.isEasyChecked.value = value ?? false;
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                )),
            Obx(() => CheckboxListTile(
                  title: Text('Medium'),
                  value: checkboxController.isMediumChecked.value,
                  onChanged: (value) {
                    checkboxController.isMediumChecked.value = value ?? false;
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                )),
            Obx(() => CheckboxListTile(
                  title: Text('Hard'),
                  value: checkboxController.isHardChecked.value,
                  onChanged: (value) {
                    checkboxController.isHardChecked.value = value ?? false;
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                )),

            SizedBox(height: 20),

            // Radio buttons for selecting number of questions
            Text(
              'Questions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Radio button for 10 questions
                Obx(() => Row(
                      children: [
                        Radio<int>(
                          value: 10,
                          groupValue: checkboxController.selectedQuestionCount.value,
                          onChanged: (value) {
                            checkboxController.selectedQuestionCount.value = value ?? 10;
                          },
                        ),
                        Text('10'),
                      ],
                    )),
          SizedBox(width: 10.w,), 
                Obx(() => Row(
                      children: [
                        Radio<int>(
                          value: 20,
                          groupValue: checkboxController.selectedQuestionCount.value,
                          onChanged: (value) {
                            checkboxController.selectedQuestionCount.value = value ?? 20;
                          },
                        ),
                        Text('20'),
                      ],
                    )),
                 SizedBox(width: 10.w,),
                Obx(() => Row(
                      children: [
                        Radio<int>(
                          value: 30,
                          groupValue: checkboxController.selectedQuestionCount.value,
                          onChanged: (value) {
                            checkboxController.selectedQuestionCount.value = value ?? 30;
                          },
                        ),
                        Text('30'),
                      ],
                    )),
              ],
            ),

            SizedBox(height: 20),

            // Submit button to show selected options
            ElevatedButton(
              onPressed: () {
                // Show selected options
                String selectedLevels = '';
                if (checkboxController.isEasyChecked.value) selectedLevels += 'Easy ';
                if (checkboxController.isMediumChecked.value) selectedLevels += 'Medium ';
                if (checkboxController.isHardChecked.value) selectedLevels += 'Hard ';
                int selectedQuestions = checkboxController.selectedQuestionCount.value;

                // Show a dialog with the selected options
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
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

