import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String titleName;
  final double? fontSize;
  final String fontName;
  final Color textColor;

  const TextWidget({
    Key? key,
    required this.titleName,
    required this.fontSize,
    required this.fontName,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titleName,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontName,
          color: textColor,
        ));
  }
}
