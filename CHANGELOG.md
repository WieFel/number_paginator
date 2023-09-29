## [0.4.0] - 29.09.2023

- New properties `showNextButton` and `showPrevButton` for showing/hiding the next/prev buttons
- New way to customize prev/next buttons using `prevButtonBuilder` or `nextButtonBuilder`

## [0.3.2] - 30.07.2023

- Correct images in README.md

## [0.3.1] - 30.07.2023

- Correct images in README.md

## [0.3.0] - 30.07.2023

- Compatibility with Dart 3
- Added package screenshots

## [0.2.3] - 19.12.2022

- Improved automatic scaling of arrow buttons and "3 dots" in `NumberContent`

## [0.2.2] - 08.10.2022

- Fixed bug in NumberContent where a page count of 1 was causing errors

## [0.2.1] - 19.09.2022

- NumberContent: now showing dots for invisible buttons on front and back, maintaining the first
  and last button always visible.

## [0.2.0] - 08.09.2022

- `NumberPaginatorController` for controlling the `NumberPaginator` from the outside

## [0.1.0] - 08.09.2022

- Upgrades to Flutter 3.3.0
- New config class `NumberPaginatorUIConfig` for configuring UI aspects of paginator
- New display modes of central paginator content: `hidden`, `numbers`, `dropdown`
- `contentBuilder` for building custom paginator content based on the current page

## [0.0.3] - 12.08.2022

- Lint fixes for Flutter 3
- AutoSizeText for number buttons to maintain text always in 1 line and visible
- Added property `showPageNumbers` and `mainAxisAlignment`

## [0.0.2] - 04.07.2021

- Project description change
- Small code improvements

## [0.0.1] - 15.05.2021

- Basic implementation of number paginator
- Customization options
