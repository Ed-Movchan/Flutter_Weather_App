import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  String selectedResult;
  final Function callback;

  MySearchDelegate(this.callback);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          selectedResult,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    selectedResult = query;
    callback(query);
    close(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = [
      "Kiev",
      "Kharkiv",
      "Lviv",
      "Odessa",
      "Dnipro",
      "Zaporizhia",
      "Mykolaiv",
      "Vinnytsia",
      "Chernihiv",
      "Kherson",
      "Poltava",
      "Khmelnytskyi",
      "Cherkasy",
      "Chernivtsi",
      "Zhytomyr",
      "Sumy",
      "Rivne",
      "Ivano-Frankivsk",
      "Ternopil",
      "Kropyvnytskyi",
      "Lutsk",
      "Uzhhorod",
      "Donetsk",
      "Luhansk",
      "Sevastopol",
      query
    ].where((element) => element.contains(query)).toList();

    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              searchResults[index],
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              selectedResult = searchResults[index];
              callback(selectedResult);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
