import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Number Paginator"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(child: Text("Arrows")),
              Tab(child: Text("Numbers")),
              Tab(child: Text("Scrollable Numbers")),
              Tab(child: Text("Dropdown")),
              Tab(child: Text("Custom")),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OnlyArrowsPage(),
            NumbersPage(),
            ScrollableNumbersPage(),
            DropdownPage(),
            BuilderPage(),
          ],
        ),
      ),
    );
  }
}
