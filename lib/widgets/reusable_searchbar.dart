import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Rsearchbar extends StatefulWidget {
  const Rsearchbar({super.key});

  @override
  State<Rsearchbar> createState() => _RsearchbarState();
}

class _RsearchbarState extends State<Rsearchbar> {
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
  @override
  List<Widget>? buildActions(BuildContext context) {
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
  }
     

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
