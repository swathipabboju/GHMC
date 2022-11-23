import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class textButton extends StatelessWidget {
  const textButton(
      {super.key,
      required this.text,
      this.backgroundcolor,
      this.height,
      this.width});
  final String text;
  final Color? backgroundcolor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundcolor ?? Colors.blueGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
        ),
      ),
    );
  }
}
