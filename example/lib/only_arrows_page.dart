import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class OnlyArrowsPage extends StatefulWidget {
  const OnlyArrowsPage({Key? key}) : super(key: key);

  @override
  _OnlyArrowsPageState createState() => _OnlyArrowsPageState();
}

class _OnlyArrowsPageState extends State<OnlyArrowsPage> {
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
      backgroundColor: Colors.orange.withOpacity(.1),
      body: pages[_currentPage],
      // For changing the look of the paginator, wrap it in a `Theme`.
      // By default, it applies the app's theme.
      bottomNavigationBar: Theme(
        data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        ),
        // card for elevation
        child: Card(
          margin: EdgeInsets.zero,
          child: NumberPaginator(
            numberPages: _numPages,
            // shows only default arrows, no center content of paginator
            config:
                const NumberPaginatorUIConfig(mode: ContentDisplayMode.hidden),
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
