import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.color,
    this.fontsize,
    this.fontweight,
    required this.text,
    this.underline,
    this.fontfamily,
    this.textAlign,
  });

  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  final String text;
  final TextDecoration? underline;
  final String? fontfamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 2,
      softWrap: true,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: fontfamily,
        fontSize: fontsize,
        fontWeight: fontweight,
        decoration: underline,
      ),
    );
  }
}
