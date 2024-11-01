import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:flutter/material.dart';

class BasicText extends StatelessWidget {
  final Color? textColor;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final bool? softWrap;
  final int? maxLines;
  final Color?backgroundColor;
  final TextAlign? textAlign;

  const BasicText({
    super.key,
    this.textColor,
    this.textAlign,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: backgroundColor,
        color: textColor ?? UIColor.black,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 16,
      ),
      textAlign: textAlign?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip, // Default olarak taşarsa kesilecek.
      softWrap: softWrap ?? true, // Varsayılan olarak sarılacak.
      maxLines: maxLines, // İstenirse maksimum satır sayısı.
    );
  }
}
