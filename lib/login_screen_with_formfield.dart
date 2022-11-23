import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/provider_file.dart';
import 'package:ghmc/routes/app_routes.dart';
import 'package:provider/provider.dart';

class loginWithFormField extends StatefulWidget {
  const loginWithFormField({super.key});

  @override
  State<loginWithFormField> createState() => _loginWithFormFieldState();
}

class _loginWithFormFieldState extends State<loginWithFormField> {
  TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.30,
          color: Color.fromARGB(255, 58, 71, 77),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      focusNode: myFocusNode,
                      controller: number,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      cursorColor: Color.fromRGBO(33, 121, 110, 1),
                      decoration: InputDecoration(
                        //to hide maxlength

                        counterText: '',
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 33, 121, 110),
                        )),

                        labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Color.fromRGBO(33, 121, 110, 1)
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: "Mobile Number",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "please enter valid number";
                        } else if (value.length < 10) {
                          return "Please Enter a Valid moile number";
                        }
                        return null;
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 60,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 15, 26, 33),
                          textStyle: TextStyle(fontSize: 24),
                          minimumSize: Size.fromHeight(55),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_isLoading) return;
                            setState(() {
                             _isLoading = true;
                             
                            });

                             
                            await Future.delayed(Duration(seconds: 3));

                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.pushNamed(context, AllRoutes.otp_screen);
                          }
                        },
                        child: _isLoading
                            ? Container(
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Loading...",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ), /* _isLoading
                ? Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            Text("Loading...",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          ),
                                    ),
                          ],
                    ),
                )
                : const Text(
                        "Login",
                        style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                  ), */
                        /*  child: _isLoading
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
                        "Login",
                        style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                  ), */
                      ),
                    ),
                  ),

                  //button
                  /*  GestureDetector(
                    onTap: (() {
                      if (_formKey.currentState!.validate()) {
                       // fetchLoginDetailsFromApi();
                      }
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 80,
                        height: 40,
                        color: Color.fromARGB(255, 9, 16, 20),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ), */
                ],
              ),
            ),
          ),
        )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  void fetchLoginDetailsFromApi() async {}

 Future loading()async {
    return await Container(
      child: _isLoading
          ? Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          : const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
    );
  }
}
