## [1.0.0] - 30.03.2025

- **BREAKING**: Arrow buttons not shown by default anymore. Use included `PrevButton` and `NextButton`
  anywhere below `NumberPaginator` in the tree to show them
- **BREAKING**: `NumberPaginatorUIConfig` removed. Customizations are now possible in a more flexible
  way, by directly using composition of child widgets, wrapping `NumberPaginator` in a `Theme`, or using `builder` functions
- `PaginatorButton` texts are not scaling their font size automatically anymore (auto_size_text dependency
  was removed). Padding of buttons was removed, so more text can fit into them
- Simpler API of `NumberPaginator` with less properties

## [0.4.4] - 02.03.2025

- New property `numbersMainAxisAlignment` in `NumberPaginatorUIConfig` for aligning the numbers in
  the paginator

## [0.4.3] - 27.12.2024

- Web demo of the example app

## [0.4.2] - 25.12.2024

- Upgrade to Flutter 3.27.1 and other upgrades

## [0.4.1] - 30.01.2024

- New properties `buttonTextStyle` and `buttonPadding` in the `NumberPaginatorUIConfig`

## [0.4.0] - 29.09.2023

- New properties `showNextButton` and `showPrevButton` for showing/hiding the next/prev buttons
- New way to customize prev/next buttons using `prevButtonBuilder` or `nextButtonBuilder`
- Slight adaptation of margin/padding of "three dots" (only noticeable if it's background is
  colored)

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
