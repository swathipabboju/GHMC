import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../routes/app_routes.dart';

class LoaderReusable extends StatefulWidget {
  const LoaderReusable(
      {super.key,
      this.loaderColor,
      this.textColor,
      this.loaderText,
      this.child,
      this.onClick});
  final Color? loaderColor;
  final Color? textColor;
  final String? loaderText;
  final Widget? child;
  final Function()? onClick;

  @override
  State<LoaderReusable> createState() => _LoaderReusableState();
}

class _LoaderReusableState extends State<LoaderReusable> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 226,
        height: 50,
        child: GestureDetector(
          child: _isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    Text("plaese wait..."),
                  ],
                )
              : const Text(
                  "login",
                  style: TextStyle(color: Colors.white),
                ),
          onTap: () async {
            if (_isLoading) return;
            setState(() {
              _isLoading = true;
            });
            await Future.delayed(Duration(seconds: 3));
            setState(() {
              _isLoading = false;
            });
            Navigator.pushNamed(context, AllRoutes.login_screen);
          },
        ),
      ),
    );
  }
}
