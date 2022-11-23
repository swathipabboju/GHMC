import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/widgets/ReLoad.dart';
import 'package:ghmc/widgets/loader_reusable.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: LoaderReusableState(loaderColor: Colors.blue,loaderText:"Loading..." ,textColor:Colors.black,textsize: 15,),
    );
  }
}
