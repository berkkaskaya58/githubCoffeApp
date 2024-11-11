import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailController extends GetxController {
  RxDouble price = 0.0.obs; // Fiyat değişkenini RxDouble olarak tanımladık
 RxBool isLiked = false.obs; 

 
  // Fiyatı güncelleyen fonksiyonları düzenliyoruz
  void priceS(double initialPrice) {
    price.value = initialPrice; // Küçük boyut için fiyatı widget'tan al
  }

  void priceM(double initialPrice) {
    price.value = initialPrice * 1.5; // Orta boyut fiyatını artır
  }

  void priceL(double initialPrice) {
    price.value = initialPrice * 2; // Büyük boyut fiyatını artır
  }
  void changeIsliked() {
  isLiked.value = !isLiked.value; // Değeri tersine çevir
}

}
