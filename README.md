# Number Paginator

[![pub.dev](https://img.shields.io/pub/v/number_paginator?logo=dart)](https://pub.dev/packages/number_paginator)
[![analysis](https://github.com/WieFel/number_paginator/workflows/analysis/badge.svg)](https://github.com/WieFel/number_paginator/actions?query=workflow%3Aanalysis)

A Flutter paginator widget for switching between page numbers. 

<img alt="screenshot1" src="https://user-images.githubusercontent.com/8345062/189090952-bb8e0069-6933-4ee7-a6a6-d08348bd7f1b.png" width="24%"/> <img alt="screenshot2" src="https://user-images.githubusercontent.com/8345062/189091546-f09ef6b0-2f32-44fa-aad9-7a13e18a4084.png" width="24%"/> <img alt="screenshot3" src="https://user-images.githubusercontent.com/8345062/189092097-bc26a03c-5c3f-441b-b110-14ada43e0c57.png" width="24%"/> <img alt="screenshot3" src="https://user-images.githubusercontent.com/8345062/189092664-9b0d6e56-1fb7-46ff-aa9f-ca9bb9a5a760.png" width="24%"/>


## Getting Started

The **number_paginator** widget allows you to implement pagination with page numbers very easily. If you have content that is split up into several pages, **number_paginator** can be used to let the user switch between these page numbers.
The package automatically handles the case where page numbers don't fit on one screen and replaces some of them with three dots.

## Usage

`NumberPaginator` only requires the number of pages (`numberPages`) to be set. All the rest is handled by the widget automatically. Normally, one also wants to react to page changes using the `onPageChange` callback. By default, `NumberPaginator` displays page numbers as central content of the paginator.
```dart
NumberPaginator(
  numberPages: 10,
  onPageChange: (int index) {

    // handle page change...
  },
)
```

### With Controller
`NumerPaginatorController` allows you to control the `NumberPaginator` from the outside, e.g. with an external button anywhere in your app.

```dart
// instantiate the controller in your state
final NumberPaginatorController _controller = NumberPaginatorController();

...
/// use it within NumberPaginator
NumberPaginator(
  controller: _controller,
  // by default, the paginator shows numbers as center content
  numberPages: _numPages,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
)

...
// Use the controller, e.g. within a button, to trigger a page change
floatingActionButton: FloatingActionButton(
  onPressed: () => _controller.next(),
  child: const Icon(Icons.navigate_next),
)

```

### Customize
`NumberPaginator` allows for several customizations.
```dart
NumberPaginator(
  // by default, the paginator shows numbers as center content
  numberPages: 10,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index; // _currentPage is a variable within State of StatefulWidget
    });
  },
  // initially selected index
  initialPage: 4,
  config: NumberPaginatorUIConfig(
    // default height is 48
    height: 64,
    buttonShape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    buttonSelectedForegroundColor: Colors.yellow,
    buttonUnselectedForegroundColor: Colors.white,
    buttonUnselectedBackgroundColor: Colors.grey,
    buttonSelectedBackgroundColor: Colors.blueGrey,
  ),
)
```
<p align="center">
  <img alt="custom buttons" src="https://user-images.githubusercontent.com/8345062/189089917-05bde1aa-6150-4e1f-bb35-e35a50fafecb.png" width="30%"/>
</p>

### Content variations
The new version of `NumberPaginator` allows for further customization of how a user can navigate between pages. It provides three different modes and an additional possibility of complete customization o the content using a `builder`.

#### Hidden (only arrows are visible)
The user only sees arrows to switch to the previous/next page.

```dart
NumberPaginator(
  numberPages: _numPages,
  // shows only default arrows, no center content of paginator
  config:
      const NumberPaginatorUIConfig(mode: ContentDisplayMode.hidden),
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
)
```
<p align="center">
  <img alt="screenshot for hidden" src="https://user-images.githubusercontent.com/8345062/189090952-bb8e0069-6933-4ee7-a6a6-d08348bd7f1b.png" width="30%"/>
</p>

#### Numbers (default)
The paginator shows numbers for switching to any page number that is visible.

```dart
NumberPaginator(
  // by default, the paginator shows numbers as center content
  numberPages: _numPages,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
)
```
<p align="center">
  <img alt="screenshot with page numbers" src="https://user-images.githubusercontent.com/8345062/189091546-f09ef6b0-2f32-44fa-aad9-7a13e18a4084.png" width="30%"/>
</p>


#### Dropdown
The paginator shows a dropdown (material widget) for choosing which page to show, along with the prev/next buttons.

```dart
NumberPaginator(
  numberPages: _numPages,
  // shows a dropdown as the center paginator content
  config: const NumberPaginatorUIConfig(
      mode: ContentDisplayMode.dropdown),
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
)
```
<p align="center">
  <img alt="screenshot with dropdown" src="https://user-images.githubusercontent.com/8345062/189092097-bc26a03c-5c3f-441b-b110-14ada43e0c57.png" width="30%"/>
</p>


#### Builder (for passing any content)
Using the `contentBuilder` property, you can pass any content that you want that should be displayed as a central part of the paginator. For example, you can pass a custom text:

```dart
NumberPaginator(
  numberPages: _numPages,
  contentBuilder: (index) => Expanded(
    child: Center(
      child: Text("Currently selected page: ${index + 1}"),
    ),
  ),
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
)
```
<p align="center">
  <img alt="screenshot with usage of builder" src="https://user-images.githubusercontent.com/8345062/189092664-9b0d6e56-1fb7-46ff-aa9f-ca9bb9a5a760.png" width="30%"/>
</p>

### Complete example
A complete example of a simple page widget with number pagination.

```dart
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
      body: pages[_currentPage],
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
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
    );
  }
}
```

## Coming soon...
- Animations

## Contribute
If you have any ideas for extending this package or have found a bug, please contribute!

1. You'll need a GitHub account.
2. Fork the [number_paginator repository](https://github.com/WieFel/number_paginator).
3. Work on your feature/bug.
4. Create a pull request.
5. Star this project. ⭐
6. Become a hero!! 🎉
