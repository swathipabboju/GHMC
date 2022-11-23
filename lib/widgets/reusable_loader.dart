
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/routes/app_routes.dart';

class Rload extends StatefulWidget {
  const Rload({super.key});

  @override
  State<Rload> createState() => _RloadState();
}

class _RloadState extends State<Rload> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 226,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 24),
              minimumSize: Size.fromHeight(55),
              shape: StadiumBorder(),
            ),
            onPressed: () async {
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
          ),
        ),
      ),
    );
  }
}
/* import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/routes/app_routes.dart';
import 'package:ghmc/widgets/load.dart';

class Rloader extends StatefulWidget {
  const Rloader({super.key});

  @override
  State<Rloader> createState() => _RloaderState();
}

class _RloaderState extends State<Rloader> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) => _isLoading
      ? Load()
      : Scaffold(
          body: ElevatedButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              await Future.delayed(Duration(seconds: 3));
              setState(() {
                _isLoading = false;
              });
              Navigator.pushNamed(context, AllRoutes.login_screen);
            },
            child: Text("load data"),
          ),
        );
}
 */









/* import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/routes/app_routes.dart';

class ReusableLoader extends StatefulWidget {
  const ReusableLoader({super.key});

  @override
  State<ReusableLoader> createState() => _ReusableLoaderState();
}

class _ReusableLoaderState extends State<ReusableLoader> {
  var _isLoading = false;
  void _onSubmit() {
    setState(() {
      _isLoading = true;
     
    });
    Future.delayed(Duration(seconds: 1), (() {
      setState(() {
        _isLoading = false;
         Navigator.pushNamed(context, AllRoutes.login_screen);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: _isLoading ? null : _onSubmit,
        icon: _isLoading
            ? Container(
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : const Text(""),
        label: const Text(
            "login")); 
  }
}
 */