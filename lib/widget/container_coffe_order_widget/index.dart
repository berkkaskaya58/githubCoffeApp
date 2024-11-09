import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';
class ContainerCoffeeOrder extends StatefulWidget {
  final String title;
  final String subTitle;
  final double price;
  final String image;
  final Function function;
  final Function(double) onPriceUpdated; // Fiyat güncellendiğinde çağrılacak fonksiyon

  const ContainerCoffeeOrder({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.function,
    required this.onPriceUpdated, // Yeni parametre
  });

  @override
  State<ContainerCoffeeOrder> createState() => _ContainerCoffeeOrderState();
}

class _ContainerCoffeeOrderState extends State<ContainerCoffeeOrder> {
  int amount = 1;
  late double price;

  @override
  void initState() {
    super.initState();
    price = widget.price;
  }

  // Miktar arttırma fonksiyonu
  void addAmount() {
    setState(() {
      amount++;
      price = widget.price * amount;  // Yeni fiyat, miktar ile çarpılarak hesaplanıyor
    });
    widget.onPriceUpdated(price);  // Fiyat güncellendikten sonra üst widget'a bildiriyoruz
  }

  // Miktar azaltma fonksiyonu
  void removeAmount() {
    setState(() {
      if (amount > 1) {
        amount--;
        price = widget.price * amount;  // Yeni fiyat, miktar ile çarpılarak hesaplanıyor
      }
    });
    widget.onPriceUpdated(price);  // Fiyat güncellendikten sonra üst widget'a bildiriyoruz
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.15;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          widget.function();
        },
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.image,
                  width: width * 5,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width / 2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicText(text: widget.title),
                    BasicText(text: widget.subTitle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: removeAmount,
                        child: const Icon(Icons.remove)),
                    SizedBox(width: width / 2),
                    BasicText(text: '$amount'),
                    SizedBox(width: width / 2),
                    GestureDetector(
                        onTap: addAmount,
                        child: const Icon(Icons.add)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
