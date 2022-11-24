import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/model.dart';
import 'package:ghmc/routes/app_routes.dart';
import 'package:ghmc/sharedpreferenace.dart';
import 'package:ghmc/widgets/text.dart';

class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  bool _isLoading = false;

  late ghmc_model ResponseData;

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
          height: MediaQuery.of(context).size.height * 0.35,
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
                            fetchLoginDetailsFromApi();

                            if (_isLoading) return;
                            setState(() {
                              _isLoading = true;
                            });

                            await Future.delayed(Duration(seconds: 3));

                            setState(() {
                              _isLoading = false;
                            });
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
                              ),
                      ),
                    ),
                  ),
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

  void fetchLoginDetailsFromApi() async {
    final requestUrl =
        "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/" + "getMpin";
    //Create payload if required i.e, when the request type is put,post,option etc
    //3. Create headers and authorisation
    //Adding Dio or http package to connect to the server
    final _dioObject = Dio();

    //Response
    try {
      final _response = await _dioObject
          .get(requestUrl, queryParameters: {"MOBILE_NO": number.text});
//
      // print("Response is $_response");

      final data = ghmc_model.fromJson(_response.data);

      if (_response.data != null) {
        setState(() {
          this.ResponseData = data;
        });
        if (ResponseData.status == 'M') {
          SharedPreferencesClass()
              .writeTheData("mobileNumber", ResponseData.mOBILENO);
          SharedPreferencesClass().writeTheData("mpin", ResponseData.mpin);
          SharedPreferencesClass().writeTheData("otp", ResponseData.otp);
          SharedPreferencesClass().writeTheData("category", ResponseData.cATEGORY);
          SharedPreferencesClass()
 .writeTheData("designation", ResponseData.dESIGNATION);
          SharedPreferencesClass().writeTheData("empd", ResponseData.eMPD);
          SharedPreferencesClass()
              .writeTheData("empName", ResponseData.eMPNAME);
          SharedPreferencesClass()
              .writeTheData("message", ResponseData.message);
          SharedPreferencesClass().writeTheData("status", ResponseData.status);
          SharedPreferencesClass()
              .writeTheData("tokenId", ResponseData.tOKENID);
          SharedPreferencesClass().writeTheData("typeId", ResponseData.tYPEID);

          Navigator.pushNamed(context, AllRoutes.otp_new_screen);
        } else if (ResponseData.status == 'O') {
          Navigator.pushNamed(context, AllRoutes.otp_new_screen);
        } else if (ResponseData.status == 'N') {
          showAlert(ResponseData.message.toString());
        }
      }

      // to show message in toast
      /*  Fluttertoast.showToast(
          msg: 'Invalid user',
          backgroundColor: Colors.grey,
        ); */

    } on DioError catch (e) {
      if (e.response?.statusCode == 404 ||
          e.response?.statusCode == 500 ||
          e.response?.statusCode == 400) {
        print(e.response?.statusMessage);
        // showAlert("${e.response?.statusMessage}");
        showAlert("Server not responding \n Please try again");
      }
    }
  }

  showAlert(String message, {String text = ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextWidget(
              text: message + text,
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              fontsize: 15,
            ),
            // title: Text(message + text),
            actions: [
              TextButton(
                onPressed: () {
                  print("clicked");
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: Text("ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        }); //showDialog
  } //
}
