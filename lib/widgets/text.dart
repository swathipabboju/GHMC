import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
     this.textcolor,
    this.fontsize,
  });
  final String text;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final Color? textcolor;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
