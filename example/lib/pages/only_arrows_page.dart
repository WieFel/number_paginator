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
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: pages[_currentPage],
      bottomNavigationBar: Material(
        child: NumberPaginator(
          numberPages: _numPages,
          child: const SizedBox(
            height: 48,
            child: Row(
              children: [
                PrevButton(),
                NextButton(),
              ],
            ),
          ),
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
