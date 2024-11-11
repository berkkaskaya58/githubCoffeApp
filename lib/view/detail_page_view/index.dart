import 'package:coffee_shop_app/controller/detail_page_controller/index.dart';
import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_description/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/view/navigation_bar_detail_page/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:coffee_shop_app/widget/button_widget/index.dart';
import 'package:coffee_shop_app/widget/container_text_widget/index.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final String text;
  final double price; // initialPrice yerine price kullanıldı
  final int index;
  
  const DetailPage(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.price, // price olarak değiştirildi
      required this.index, });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // late double price; // `price` değişkeni late olarak tanımlandı
  // Heart iconu için başlangıçta beğenilmedi olarak ayarladık
  late final DetailController controller;

  @override
   void initState() {
    super.initState();
    controller = Get.put(DetailController()); // controller'ı burada başlatıyoruz
    controller.price.value = widget.price; // Başlangıç fiyatını al
  }


  // @override
  // void initState() {
  //   super.initState();
  //   price = widget.price; // `price` widget'tan alınarak başlatıldı
  // }

  // Orta boyut fiyat fonksiyonu
  // void priceM() {
  //   setState(() {
  //     price = widget.price * 1.5; // Orta boyut için fiyatı günceller
  //   });
  // }

  // // Büyük boyut fiyat fonksiyonu
  // void priceL() {
  //   setState(() {
  //     price = widget.price * 2; // Büyük boyut için fiyatı günceller
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      backgroundColor: UIColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: paddingWidth, right: paddingWidth, bottom: height  ,top: height),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: paddingWidth * 1.5,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(UIImage.arrowLeft))),
                  const BasicText(
                    text: 'Detay',
                    fontSize: 20,
                  ),
                 Obx(() {
  return GestureDetector(
    onTap: () {
      controller.changeIsliked();
    },
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: controller.isLiked.value
          ? const Icon(EvaIcons.heart, color: Colors.red, key: ValueKey('liked'))
          : const Icon(EvaIcons.heartOutline, color: Colors.grey, key: ValueKey('unliked')),
    ),
  );
})

                ],
              ),
              SizedBox(height: height),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  width: double.infinity,
                  height: 202,
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicText(
                    text: widget.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ],
              ),
              const Row(
                children: [
                  BasicText(
                    text: 'Ice/Hot',
                    textColor: UIColor.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(UIImage.star),
                  const SizedBox(width: 5),
                  const BasicText(text: '4.8'),
                  const SizedBox(width: 5),
                  const BasicText(
                    text: '(230)',
                    textColor: UIColor.grey,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height , left: paddingWidth, right: paddingWidth),
                child: const Divider(),
              ),
              SizedBox(height: height),
              const Row(
                children: [
                  BasicText(
                    text: 'Description',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: BasicText(
                      textColor: UIColor.grey,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      text: UIDescription.description[widget.index],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Row(
                children: [
                  BasicText(
                    text: 'Size',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 ContainerText(
                text: 'S',
                function: () {
                  controller.priceS(widget.price); // Küçük boyut fiyatını sıfırla
                },
              ),
              ContainerText(
                text: 'M',
                function: (){controller.priceM(widget.price);} // Orta boyut için fonksiyonu çağır
              ),
              ContainerText(
                text: 'L',
                function: (){controller.priceL(widget.price);}, // Büyük boyut için fonksiyonu çağır
              ),
                ],
              ),
              SizedBox(height: height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const BasicText(
                        text: 'Price', // Eski fiyat burada gösterilir
                        fontSize: 20,
                        textColor: UIColor.grey,
                      ),
                      Obx(() {
                        return BasicText(
                          text: controller.price.value.toStringAsFixed(2), // Güncellenmiş fiyat burada gösterilir
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          textColor: UIColor.loginButtonColor,
                        );
                      }),
                    ],
                  ),
                  SizedBox(width: paddingWidth),
                  Expanded(
                    child: CustomButton(
                      function: () => Get.to(() => CustomNavigationBar(price: controller.price.value, imagePath: widget.imagePath)),
                      height: height * 3,
                      width: paddingWidth * 12,
                      text: 'Buy Now',
                      fontWeight: FontWeight.bold,
                      textColor: UIColor.white,
                      backgroundColor: UIColor.loginButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
