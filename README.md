# Number Paginator

[![pub.dev](https://img.shields.io/pub/v/number_paginator?logo=dart)](https://pub.dev/packages/number_paginator)
[![analysis](https://github.com/WieFel/number_paginator/workflows/analysis/badge.svg)](https://github.com/WieFel/number_paginator/actions?query=workflow%3Aanalysis)

A Flutter paginator widget for switching between page numbers. 

<img alt="screenshot1" src="https://user-images.githubusercontent.com/8345062/118354008-480df580-b569-11eb-80f8-4dc89731d614.png" width="30%"/> <img alt="screenshot2" src="https://user-images.githubusercontent.com/8345062/118354019-53f9b780-b569-11eb-937d-9042ba5d26d9.png" width="30%"/> <img alt="screenshot3" src="https://user-images.githubusercontent.com/8345062/118354043-6ffd5900-b569-11eb-9d9a-92585733ab44.png" width="30%"/>


## Getting Started

The **number_paginator** widget allows you to implement pagination with page numbers very easily. If you have a list that is split up into several pages, **number_paginator** can be used to let the user switch between these page numbers.
The package automatically handles the case where page numbers don't fit on one screen and replaces some of them with three dots.

## Usage

`NumberPaginator` only requires the number of pages (`numberPages`) to be set. All the rest is handled by the widget automatically. Normally, one also wants to react to page changes using the `onPageChange` callback.
```dart
NumberPaginator(
  numberPages: 10,
  onPageChange: (int index) {

    // handle page change...
  },
)
```

### Customize
`NumberPaginator` allows for several customizations.
```dart
NumberPaginator(
  numberPages: 10,
  onPageChange: (int index) {
    setState(() {
      _currentPage = index;
    });
  },
  // initially selected index
  initialPage: 4,
  // default height is 48
  height: 70,
  buttonShape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  buttonSelectedForegroundColor: Colors.yellow,
  buttonUnselectedForegroundColor: Colors.white,
  buttonUnselectedBackgroundColor: Colors.grey,
  buttonSelectedBackgroundColor: Colors.blueGrey,
)
```
<p align="center">
  <img alt="screenshot4" src="https://user-images.githubusercontent.com/8345062/118354836-4cd4a880-b56d-11eb-8a92-1dfe9c770782.png" width="30%"/>
</p>

## Coming soon...
- More customization options
- Animations

## Contribute
If you have any ideas for extending this package or have found a bug, please contribute!

1. You'll need a GitHub account.
2. Fork the [number_paginator repository](https://github.com/WieFel/number_paginator).
3. Work on your feature/bug.
4. Create a pull request.
5. Star this project. ⭐
6. Become a hero!! 🎉
