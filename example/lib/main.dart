import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Demo',
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.orange,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32),
              child: NumberPaginator(
                pageOptionsShown: 5,
                onPageChange: (index) => print("Page selected $index"),
                numberPages: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
