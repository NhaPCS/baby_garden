import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String data;
  final TextStyle style;

  MyText(this.data, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data == null ? "" : data,
      style: style,
    );
  }
}
