import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
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
        backgroundColor: Colors.green.withOpacity(.1),
        body: pages[_currentPage],
        // For changing the look of the paginator, wrap it in a `Theme`.
        // By default, it applies the app's theme.
        bottomNavigationBar: Theme(
          data: ThemeData.from(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
          // card for elevation
          child: Card(
            margin: EdgeInsets.zero,
            child: NumberPaginator(
              numberPages: _numPages,
              // shows a dropdown as the center paginator content
              config: const NumberPaginatorUIConfig(
                  mode: ContentDisplayMode.dropdown),
              onPageChange: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ));
  }
}
