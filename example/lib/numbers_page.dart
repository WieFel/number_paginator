import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final int _numPages = 10;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text(
          "Page ${index + 1}",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.red.withOpacity(.1),
      body: pages[_currentPage],
      // For changing the look of the paginator, wrap it in a `Theme`.
      // By default, it applies the app's theme.
      bottomNavigationBar: Theme(
        data: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
        // card for elevation
        child: Card(
          margin: EdgeInsets.zero,
          child: NumberPaginator(
            // by default, the paginator shows numbers as center content
            numberPages: _numPages,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
