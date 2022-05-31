import 'package:flutter/material.dart';


class TitleText extends StatelessWidget {

  final Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;


  TitleText({
    Key? key, 
    required this.text,
    this.color = Colors.white,
    this.size = 20,
    this.textOverflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow, 
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}