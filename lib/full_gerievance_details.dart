import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/widgets/text.dart';

class FullGrievanceDetails extends StatefulWidget {
  const FullGrievanceDetails({super.key});

  @override
  State<FullGrievanceDetails> createState() => _FullGrievanceDetailsState();
}

class _FullGrievanceDetailsState extends State<FullGrievanceDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                //child: Container(child:) 
                /* Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                 
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back),
                     Text("Take Action",style: TextStyle(color: Colors.black,fontSize: 10),)
                      
                    ],
                  ),
                ), */
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.55,
              child: Scaffold(
                appBar: AppBar(backgroundColor: Colors.white, actions: [
                  IconButton(
                    onPressed: (() {
                      // showSearch(context: context, delegate: CustomSearchDelegate());
                    }),
                    icon: Icon(Icons.search),
                    color: Colors.black,
                  ),
                ]),
              ),
            ),

          ],
        ) /* Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, actions: [
        IconButton(
            onPressed: (() {
             // showSearch(context: context, delegate: CustomSearchDelegate());
            }),
            icon: Icon(Icons.search)),
      ]),
    ) , */
        );
    /* Scaffold(
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
            GestureDetector(
              onTap: () {
                print("clicked");
                
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.88,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextWidget(
                          text: "Search by Complaint id",
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          textcolor: Colors.grey,
                        ),
                        Icon(Icons.search_sharp)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ); */
  }
}
