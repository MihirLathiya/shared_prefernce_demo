import 'package:flutter/material.dart';

class SearchItems extends SearchDelegate<String> {
  final products = [
    "Book",
    "Pen",
    "Pencil",
    "Bag",
    "Compass Box",
    "Class 1",
    "Class 2",
    "Class 3",
    "Class 4",
    "Class 5",
    "Stationery",
    "Crafts and Material",
    "Office Stationery",
  ];

  final recentProducts = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        color: Colors.grey.shade300,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? products
        : products.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          leading: const Icon(Icons.menu_book_sharp),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index],
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index],
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
