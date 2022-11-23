import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ghmc/widgets/text.dart';
import 'package:image_picker/image_picker.dart';

class ReusableSearchbar extends StatefulWidget {
  const ReusableSearchbar({super.key});

  @override
  State<ReusableSearchbar> createState() => _ReusableSearchbarState();
}

class _ReusableSearchbarState extends State<ReusableSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, actions: [
        IconButton(
            onPressed: (() {
              showSearch(context: context, delegate: CustomSearchDelegate());
            }),
            icon: Icon(Icons.search)),
      ]),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResults = ["12", "23", "34", "56"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (() {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
            //
          }),
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (() {
          close(context, null);
        }),
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(child: TextWidget(text: query, left: 0, right: 0, top: 0, bottom: 0,textcolor: Colors.green,)),
    );
   
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    List<String> matchquery = searchResults.where((element) {
      final res = element.toLowerCase();
      final input = query.toLowerCase();
      return res.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: ((context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text("${result}"),
            onTap: (() {
              query = result;
              showResults(context);
            }),
          );
        }));

    
  }
}
