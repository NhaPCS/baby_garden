import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final int maxLines;
  final TextOverflow overflow;

  MyText(this.data, {this.style, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      data == null ? "" : data,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
