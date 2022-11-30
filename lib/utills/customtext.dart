import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;

  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return Text(text,
        textAlign: align,
        style: TextStyle(
          fontSize: size ?? 16,
          fontWeight: weight ?? FontWeight.normal,
          color: color ?? Colors.black,
        ));
  }
}
