import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class ContainerText extends StatefulWidget {
  final String text;
  final Function function;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Icon? prefixIcon;
  final Color? borderColor;

  ContainerText({
    Key? key,
    required this.text,
    required this.function,
    this.prefixIcon,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ContainerText> createState() => _ContainerTextState();
}

class _ContainerTextState extends State<ContainerText> {
  late Color _backgroundColor;
  late Color _textColor;
  bool _isClicked = false; // Yerel durum

  @override
  void initState() {
    super.initState();
    // Başlangıçta background ve text renklerini onClick durumuna göre ayarlıyoruz
    _backgroundColor = _isClicked ? UIColor.loginButtonColor : UIColor.white;
    _textColor = _isClicked ? UIColor.white : UIColor.black;
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = widget.width ?? MediaQuery.of(context).size.width * 0.25;
    double containerHeight = widget.height ?? 50;

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        color: _backgroundColor, // Arka plan rengini ayarlıyoruz
        child: GestureDetector(
          onTap: () {
            widget.function(); // Tıklama fonksiyonu
            setState(() {
              _isClicked = !_isClicked; // Durumu tersine çeviriyoruz
              _backgroundColor = _isClicked ? UIColor.loginButtonColor : UIColor.white;
              _textColor = _isClicked ? UIColor.white : UIColor.black;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: widget.prefixIcon,
                ),
              BasicText(
                textAlign: TextAlign.center,
                text: widget.text,
                textColor: _textColor, // Metin rengini ayarlıyoruz
              ),
            ],
          ),
        ),
      ),
    );
  }
}
