import 'package:get/get.dart';
import 'package:coffee_shop_app/ui/ui_color/index.dart';

class ContainerTextController extends GetxController {
  var backgroundColor = UIColor.white.obs; // Arka plan rengi
  var textColor = UIColor.black.obs; // Metin rengi
  var text = ''.obs; // Gösterilecek metin
  Function? function; // Tıklandığında çağrılacak fonksiyon

  void setFunction(Function newFunction) {
    function = newFunction;
  }

  void toggleColors() {
    if (backgroundColor.value == UIColor.loginButtonColor) {
      backgroundColor.value = UIColor.white;
      textColor.value = UIColor.black;
    } else {
      backgroundColor.value = UIColor.loginButtonColor;
      textColor.value = UIColor.white;
    }
  }
}
