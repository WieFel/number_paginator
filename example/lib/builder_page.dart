import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({Key? key}) : super(key: key);

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
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
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          numberPages: _numPages,
          child: SizedBox(
            height: 48.0,
            child: Row(
              children: [
                const PrevButton(),
                Expanded(
                  child: CustomContent(
                    builder: (context, currentPage) => Center(
                      child: Text("Currently selected page: ${currentPage + 1}"),
                    ),
                  ),
                ),
                const NextButton(),
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
