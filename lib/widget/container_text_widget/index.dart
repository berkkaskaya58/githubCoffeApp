import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class ContainerText extends StatefulWidget {
  Color? backgroundColor;
  Color? textColor;
  final String text;
  final Function function;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Icon? prefixIcon;
  final Color? borderColor;

  ContainerText({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.prefixIcon,
    this.textColor = UIColor.black,
    required this.text,
    required this.function,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ContainerText> createState() => _ContainerTextState();
}

class _ContainerTextState extends State<ContainerText> {
  @override
  Widget build(BuildContext context) {
    // Varsayılan genişlik ve yükseklik değerleri
    double containerWidth = widget.width ?? MediaQuery.of(context).size.width * 0.25; // %25 genişlik
    double containerHeight = widget.height ?? 50; // Varsayılan yükseklik

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(15), // Varsayılan border radius
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? UIColor.white, // Arka plan rengi
          border: Border.all(color: widget.borderColor ?? UIColor.white), // Çerçeve rengi
        ),
        child: GestureDetector(
          onTap: () {
            widget.function(); // Tıklama işlevi
            setState(() {
              // Arka plan ve metin rengini değiştir
              if (widget.backgroundColor == UIColor.loginButtonColor) {
                widget.backgroundColor = UIColor.white;
                widget.textColor = UIColor.black;
              } else {
                widget.backgroundColor = UIColor.loginButtonColor;
                widget.textColor = UIColor.white;
              }
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Ortalanmış dizilim
            children: [
              if (widget.prefixIcon != null) // Eğer prefixIcon verilmişse
                Padding(
                  padding: const EdgeInsets.only(right: 8.0), // İkon ile metin arasında boşluk
                  child: widget.prefixIcon,
                ),
              BasicText(
                textAlign: TextAlign.center,
                text: widget.text,
                textColor: widget.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
