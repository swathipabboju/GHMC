import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/notifier_list.dart';
import 'package:ghmc/widgets/image_picker.dart';
import 'package:ghmc/widgets/text.dart';

class TakeActionScreen extends StatefulWidget {
  const TakeActionScreen({super.key});

  @override
  State<TakeActionScreen> createState() => _TakeActionScreenState();
}

class _TakeActionScreenState extends State<TakeActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Take Action",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            ValueListenableBuilder(
              valueListenable: selectedCountry,
              builder: (context, value, child) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(color: Colors.white),
                      child: DropdownButton(
                       
                        hint: value == null
                            ? Text('Please Select Country')
                            : Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        dropdownColor:Colors.white,
                        iconEnabledColor: Colors.black,
                       
                        style: TextStyle(color: Colors.black),
                        items: ['   select', '    Uk', '    USA', '   india'].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          print(val);
                          selectedCountry.value = val;
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Center(
              child: Container(color: Colors.white,
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.88,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextWidget(text:"Enter Your Remarks", left: 8, right: 8, top: 8, bottom: 8,textcolor: Colors.grey,)
              )
              ,),
            ),
             ImgPicker()
          ],
        ),
      ),
    );
  }
}
