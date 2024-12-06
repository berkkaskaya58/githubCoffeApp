import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailController extends GetxController {
  RxDouble price = 0.0.obs; 
  RxBool isLiked = false.obs;
  RxList<Map<String, dynamic>> favorites = <Map<String, dynamic>>[].obs;

  // Fiyatı güncelleyen fonksiyonlar
  void priceS(double initialPrice) {
    price.value = initialPrice;
  }

  void priceM(double initialPrice) {
    price.value = initialPrice * 1.5;
  }

  void priceL(double initialPrice) {
    price.value = initialPrice * 2;
  }

  void changeIsliked() {
    isLiked.value = !isLiked.value;
  }

  // Favori listesine veri ekleme
  void addToFavorites({
    required String imagePath,
    required String text,
    required double price,
    required int index,
  }) {
    favorites.add({
      'imagePath': imagePath,
      'text': text,
      'price': price,
      'index': index,
    });
  }
}

