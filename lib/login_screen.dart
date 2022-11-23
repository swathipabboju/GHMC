import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController number = TextEditingController();
 

 

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),

        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.27,
          color: Color.fromARGB(255, 58, 71, 77),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: number,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    cursorColor: Color.fromRGBO(33, 121, 110, 1),
                    decoration: InputDecoration(
                      //to hide maxlength
                      counterText: '',
                      // hintText: hintText,

                      /* suffixIcon: showSuffix
                          ? const Icon(Icons.error_outline_rounded,
                              color: Colors.red)
                          : null, */

                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 33, 121, 110),
                      )),

                      labelText: "Mobile Number",

                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 33, 121, 110),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  //button
                  GestureDetector(
                    onTap: (() {
                      var res = validateMobile(number.text.toString());
                      if (res == false) {
                        print("enter valid mobile number");

                        
                      } else {
                        print(number.text);
                      }
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
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
                  ),
                ],
              ),
            ),
          ),
        )
        )
        );
  }

  bool validateMobile(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < 10) {
      return false;
    }
    return true;
  }
}
