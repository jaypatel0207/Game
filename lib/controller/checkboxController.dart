import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckboxController extends GetxController {

  var isEasyChecked = false.obs;
  var isMediumChecked = false.obs;
  var isHardChecked = false.obs;

  
  var selectedQuestionCount = 20.obs; 
}
