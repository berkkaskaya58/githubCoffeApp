import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:coffee_shop_app/widget/button_widget/index.dart';
import 'package:coffee_shop_app/widget/container_coffe_order_widget/index.dart';
import 'package:coffee_shop_app/widget/container_text_widget/index.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String imagePath;
  final String? text;
  final double price;
  final int? index;


  const OrderPage({
    super.key,
    required this.imagePath,
    this.text,
    required this.price,
    this.index,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late double updatedPrice;

  @override
  void initState() {
    super.initState();
    updatedPrice = widget.price;  // Başlangıçta gelen fiyat
  }

  // Fiyat güncellenince çalışacak fonksiyon
  void updatePrice(double newPrice) {
    setState(() {
      updatedPrice = newPrice;  // Fiyatı güncelle
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.55;

    return Scaffold(
      backgroundColor: UIColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height / 8, horizontal: width),
          child: Column(
            children: [
              // Üst navigasyon çubuğu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: width * 1.5,
                      child: Image.asset(UIImage.arrowLeft),
                    ),
                  ),
                  const BasicText(
                    text: 'Sipariş',
                    fontSize: 20,
                  ),
                  const Icon(
                    Icons.heart_broken_outlined,
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: height / 1.5,
              ),
              // Başlık ve adres bilgileri
              const Row(
                children: [
                  BasicText(text: 'Sipariş Adresi'),
                ],
              ),
              const Row(
                children: [
                  BasicText(text: 'Elazığ Merkez'),
                ],
              ),
              // Adres ve Not ekle butonları
              Row(
                children: [
                  ContainerText(
                    borderRadius: BorderRadius.circular(20),
                    borderColor: UIColor.grey,
                    width: width*8,
                    text: 'Adresi Düzenle',
                    function: () {},
                    prefixIcon: const Icon(Icons.edit),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(height: height / 8),

              // Kahve içeriği gösterimi için kaydırılabilir alan
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ContainerCoffeeOrder(
                        title: widget.text ?? 'Ürün Adı',
                        subTitle: 'Açıklama',
                        price: widget.price,
                        image: widget.imagePath ,
                        function: () {
                          setState(() {
                            // Fiyat güncellenmeden önce yapılacak diğer işlemler
                          });
                        },
                        onPriceUpdated: updatePrice,  // Fiyat güncelleme fonksiyonunu geçiyoruz
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const BasicText(text: 'Payment Summary'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BasicText(text: 'Price'),
                      BasicText(
                        text: updatedPrice.toStringAsFixed(2), // Güncellenmiş fiyatı burada gösteriyoruz
                      ),
                    ],
                  ),
                  SizedBox(height: height / 8),
                  CustomButton(
                    backgroundColor: UIColor.loginButtonColor,
                    height: height / 5,
                    text: 'Order',
                    function: () {},
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
