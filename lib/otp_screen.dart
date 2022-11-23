import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/widgets/background_image.dart';
import 'package:ghmc/widgets/button.dart';
import 'package:ghmc/widgets/text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  TextEditingController Otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Verification Code",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.50,
            color: const Color.fromARGB(255, 58, 71, 77),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const TextWidget(
                        text: "Please type the verification code \nsent to ",
                        textcolor: Colors.white,
                        fontsize: 17,
                        left: 10,
                        right: 80,
                        top: 20,
                        bottom: 0),
                    Padding(
                      padding: const EdgeInsets.only(right: 150, left: 160),
                      child: TextFormField(
                        controller: Otp,
                       /*  onChanged: (text) {
                          if (text.isNotEmpty) {
                            setState(() {
                              valid();
                            });
                            print("not empty");
                          } else {
                            v();
                            print("empty");
                          }
                        }, */
                        maxLength: 4,
                        style: const TextStyle(color: Colors.white),
                        onTap: () {
                          FocusNode().hasFocus ? valid() : v();
                        },
                        cursorColor: const Color.fromRGBO(33, 121, 110, 1),
                        focusNode: myFocusNode,
                        decoration: InputDecoration(
                            counterText: '',
                            hintText: "0000",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: myFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            )),
                      ),
                    ),


                    FocusNode().hasFocus ? valid() : v(),
                    Text("${FocusNode().hasFocus}"),
                    
                    // v(),
                    //valid(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  void dispose() {
    Otp.dispose();
    super.dispose();
  }

  v() {
    return Container(
      child: Column(
        children: const [
          
          textButton(
            
            text: "VALIDATE OTP",
            height: 45,
            width: 150,
            backgroundcolor: Colors.pinkAccent,
          ),
          TextWidget(
            
              text: "Waiting for OTP: 00: 10 ",
              textcolor: Colors.white,
              fontsize: 17,
              left: 0,
              right: 0,
              top: 20,
              bottom: 0),
        ],
      ),
    );
  }

  valid() {
    return Container(
      child: Column(
        children: const [
          textButton(
            text: "VALIDATE OTP",
            height: 45,
            width: 150,
            backgroundcolor: Colors.pinkAccent,
          ),
          TextWidget(
              text: "Don't Recieve the code? ",
              textcolor: Colors.white,
              fontsize: 17,
              left: 0,
              right: 0,
              top: 20,
              bottom: 0),
          textButton(
            text: "RESEND",
            height: 45,
            width: 150,
            backgroundcolor: Colors.pinkAccent,
          )
        ],
      ),
    );
  }

 
}
