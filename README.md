# Number Paginator

[![pub.dev](https://img.shields.io/pub/v/number_paginator?logo=dart)](https://pub.dev/packages/number_paginator)
[![analysis](https://github.com/WieFel/number_paginator/workflows/analysis/badge.svg)](https://github.com/WieFel/number_paginator/actions?query=workflow%3Aanalysis)
[![demo](https://img.shields.io/badge/demo-web-blue?logo=googlechrome&logoColor=white&color=blue)](https://wiefel.github.io/number_paginator/#/)

A Flutter paginator widget for switching between page numbers. 

<img alt="screenshot1" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num1.png" width="24%"/> <img alt="screenshot2" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num2.png" width="24%"/> <img alt="screenshot3" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num3.png" width="24%"/> <img alt="screenshot3" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num4.png" width="24%"/>
[→ Check web demo](https://wiefel.github.io/number_paginator/#/)

## Getting Started

The **number_paginator** package allows you to implement pagination with page numbers very easily. If you have content that is split up into several pages, **number_paginator** can be used to let the user switch between these page numbers.
The package automatically handles the case where page numbers don't fit on one screen and replaces some of them with three dots.

## Usage - Version 1.0.0 or newer

`NumberPaginator` only requires the number of pages (`numberPages`) to be set. All the rest is handled by the widget automatically. Normally, one also wants to react to page changes using the `onPageChange` callback. By default, `NumberPaginator` displays just page numbers, without arrow buttons for "previous" or "next" (unlike in the versions previous to 1.0.0).

```dart
NumberPaginator(
  numberPages: 10,
  onPageChange: (int index) {
    // handle page change...
  },
)
```
<p align="center">
  <img alt="simple usage screenshot" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/usage_1.png" width="30%"/>
</p>

### With arrow buttons
From version 1.0.0 on, the back/next buttons are **not** shown by default. You can manually add `PrevButton` and `NextButton` widgets, which come included with the package. This gives more freedom compared to the versions before 1.0.0, and lets you customize the layout as you need.
```dart
NumberPaginator(
  numberPages: 10,
  onPageChange: (int index) {
    // handle page change...
  },
  child: const SizedBox(
    height: 48,
    child: Row(
      children: [
        PrevButton(),
        Expanded(
          child: NumberContent(),
        ),
        NextButton(),
      ],
    ),
  ),
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
  numberPages: 10,
  onPageChange: (int index) {
    // handle page change...
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
`NumberPaginator` version 1.0.0 and later provides more flexibility when it comes to customization.

#### Button look and feel
```dart
// define variables in your widget state
final int _numPages = 10;
final NumberPaginatorController _controller = NumberPaginatorController();

// use in the build method
NumberPaginator(
  controller: _controller,
  numberPages: _numPages,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
  child: SizedBox(
    height: 64,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: NumberContent(
        buttonBuilder: (context, index, isSelected) => _CustomButton(
          onTap: () => _controller.navigateToPage(index),
          text: '${index + 1}',
          isSelected: isSelected,
        ),
      ),
    ),
  ),
)

// define any custom button widget that you like
class _CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const _CustomButton({
    required this.onTap,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: Text(text),
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
```
<p align="center">
  <img alt="custom buttons" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/customize_buttons_new.png" width="30%"/>
</p>

### Content variations
`NumberPaginator` allows for customization of how a user can navigate between pages. It provides three different modes and an additional possibility of complete customization o the content using a `builder`.

#### Numbers (default)
The paginator shows numbers for switching to any page number that is visible. If the pages don't
fit on the screen, some of them are replaced with three dots.

```dart
NumberPaginator(
  ...
  child: const SizedBox(
    height: 48,
    child: Row(
      children: [
        PrevButton(),
        Expanded(
          child: NumberContent(),
        ),
        NextButton(),
      ],
    ),
  ),
)
```
<p align="center">
  <img alt="screenshot with page numbers" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num2.png" width="30%"/>
</p>

##### Scrollable Numbers
The page numbers can also be made scrollable. Just use `ScrollableNumberContent` for that.

```dart
NumberPaginator(
  ...
  child: const SizedBox(
    height: 48,
    child: Row(
      children: [
        PrevButton(),
        Flexible(child: ScrollableNumberContent()),
        NextButton(),
      ],
    ),
  ),
)
```
<p align="center">
  <img alt="gif with scrollable page numbers" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/scrollable_numbers.gif" width="30%"/>
</p>

#### Dropdown
The paginator shows a dropdown (material widget) for choosing which page to show, along with the prev/next buttons.

```dart
NumberPaginator(
  ...
  child: const SizedBox(
    height: 48,
    child: Row(
      children: [
        PrevButton(),
        Expanded(
          child: DropDownContent(),
        ),
        NextButton(),
      ],
    ),
  ),
)
```
<p align="center">
  <img alt="screenshot with dropdown" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num3.png" width="30%"/>
</p>


#### CustomContent (for passing any content)
Using the `builder` property, you can pass any content that you want that should be displayed as a central part of the paginator. For example, you can pass a custom text:

```dart
NumberPaginator(
  ...
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
)
```
<p align="center">
  <img alt="screenshot with usage of builder" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num4.png" width="30%"/>
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
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          child: const SizedBox(
            height: 48,
            child: Row(
              children: [
                PrevButton(),
                Expanded(
                  child: NumberContent(),
                ),
                NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Usage - Version 0.4.4 or older
<details>
<summary>Show usage instructions</summary>

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

#### Button look and feel
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
  <img alt="custom buttons" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/customize_buttons.png" width="30%"/>
</p>

#### Visibility/customisation of prev/next buttons
```dart
NumberPaginator(
  // by default, the paginator shows numbers as center content
  numberPages: 10,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index; // _currentPage is a variable within State of StatefulWidget
    });
  },
  // show/hide the prev/next buttons
  showPrevButton: true,
  showNextButton: false,  // defaults to true
  // custom content of the prev/next buttons, maintains their behavior 
  nextButtonContent: Icon(Icons.arrow_right_alt),
  // custom prev/next buttons using builder (ignored if showPrevButton/showNextButton is false)
  prevButtonBuilder: (context) => TextButton(
    onPressed: _controller.currentPage > 0 ? () => _controller.prev() : null,  // _controller must be passed to NumberPaginator
    child: const Row(
      children: [
        Icon(Icons.chevron_left),
        Text("Previous"),
      ],
    ),
  ),
)
```
<p align="center">
  <img alt="prev/next button customisation" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/customize_prev_next.png" width="30%"/>
</p>

### Content variations
`NumberPaginator` allows for customization of how a user can navigate between pages. It provides three different modes and an additional possibility of complete customization o the content using a `builder`.

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
  <img alt="screenshot for hidden" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num1.png" width="30%"/>
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
  <img alt="screenshot with page numbers" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num2.png" width="30%"/>
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
  <img alt="screenshot with dropdown" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num3.png" width="30%"/>
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
  <img alt="screenshot with usage of builder" src="https://github.com/WieFel/number_paginator/raw/main/screenshots/num4.png" width="30%"/>
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

</details>


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
