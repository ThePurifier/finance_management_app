import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {

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
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      overflow: widget.textOverflow, 
      style: TextStyle(
        fontSize: widget.size,
        fontWeight: FontWeight.bold,
        color: widget.color,
      ),
    );
  }
}