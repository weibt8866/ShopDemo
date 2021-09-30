import 'package:get/get.dart';

class FindCtl extends GetxController {
  var value = 0.obs;

  void incement(int i) => {value.value += i};
}
