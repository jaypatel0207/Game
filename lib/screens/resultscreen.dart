import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/controller/mathController.dart';
import 'package:game/screens/home.dart';
import 'package:get/get.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({super.key});

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  final MathController controller = Get.find<MathController>();

  @override
  Widget build(BuildContext context) {
    int totalQuestions = controller.totalQuestions.value;
    double percentage = (controller.correctCount.value / totalQuestions) * 100;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Home.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
 const Center(
   child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Text(
                        'Addition Practice Completed!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
     ],
   ),
 ),

 SizedBox(height: 40),
                _buildScoreCard(totalQuestions, percentage),
                SizedBox(height: 40),
                _buildPlayAgainButton(),
                 SizedBox(height: 25.h,), 
                ElevatedButton(
      onPressed: () {
         controller.resetGame();
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
          ))
        ],
      ),
    );
  }
}


 Widget _buildScoreCard(int totalQuestions, double percentage) {
    final MathController controller = Get.find<MathController>();

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
      final MathController controller = Get.find<MathController>();

    return ElevatedButton(
      onPressed: () {
        controller.resetGame();
        Get.off(() => Home());
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