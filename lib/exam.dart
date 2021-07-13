import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GFSearchBar(
          searchList: list,
          searchQueryBuilder: (query, list) {
            var x = list as List<String>;
            return list
                .where(
                    (item) => item.toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          overlaySearchListItemBuilder: (item) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                item.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          onItemSelected: (item) {
            setState(() {
              print('$item');
            });
          },
        ),
      ),
      body: GFSearchBar(
        searchList: list,
        searchQueryBuilder: (query, list) {
          var x = list as List<String>;
          return list
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        overlaySearchListItemBuilder: (item) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              item.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        onItemSelected: (item) {
          setState(() {
            print('$item');
          });
        },
      ),
    );
  }
}
