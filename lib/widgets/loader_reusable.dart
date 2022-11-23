import 'package:flutter/material.dart';
import 'package:ghmc/notifier.dart';
import 'package:provider/provider.dart';

class LoaderReusableState extends StatelessWidget {
  const LoaderReusableState(
      {super.key,
      this.loaderColor,
      this.textColor,
      this.loaderText,
      this.child,
      this.onClick, this.textsize});
  final Color? loaderColor;
  final Color? textColor;
  final String? loaderText;
  final double? textsize;
  final Widget? child;
  final Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(
              color: loaderColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              loaderText ?? "",
              style: TextStyle(color: textColor,fontSize: textsize,),
            ),
          ),
        ],
      ),
    );
  }
}
