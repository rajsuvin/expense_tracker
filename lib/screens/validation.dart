import 'package:get/get.dart';

class Validator extends GetxController{
  String? isEmpty(value){
    if(value!.isEmpty){
      return'Plese fill the details';
    }
    return null;
  }
}