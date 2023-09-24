import 'package:flutter/material.dart';
import 'package:number_paginator/src/model/config.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/number_paginator_controller.dart';
import 'package:number_paginator/src/ui/widgets/buttons/paginator_button.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content.dart';

typedef NumberPaginatorContentBuilder = Widget Function(int index);

/// The main widget used for creating a [NumberPaginator].
class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The UI config for the [NumberPaginator].
  final NumberPaginatorUIConfig config;

  /// A builder for the central content of the paginator. If provided, the
  /// [config] is ignored.
  final NumberPaginatorContentBuilder? contentBuilder;

  final NumberPaginatorController? controller;

  /// Whether the "prev" button should be shown.
  ///
  /// Defaults to `true`.
  final bool showPrevButton;

  /// Whether the "next" button should be shown.
  ///
  /// Defaults to `true`.
  final showNextButton;

  /// Content of the "previous" button which is automatically displayed and goes
  /// one page back.
  ///
  /// Defaults to:
  /// ```dart
  /// const FittedBox(
  ///   child: Icon(Icons.chevron_left),
  /// )
  /// ```
  final Widget prevButtonContent;

  /// Content of the "next" button which is automatically displayed and goes
  /// one page forward.
  ///
  /// Defaults to:
  /// ```dart
  /// const FittedBox(
  ///   child: Icon(Icons.chevron_right),
  /// )
  /// ```
  final Widget nextButtonContent;

  /// Builder option for providing a custom "previous" button.
  ///
  /// If this is provided, [prevButtonContent] is ignored.
  /// If [showPrevButton] is `false`, this is ignored.
  final WidgetBuilder? prevButtonBuilder;

  /// Builder option for providing a custom "next" button.
  ///
  /// If this is provided, [nextButtonContent] is ignored.
  /// If [showNextButton] is `false`, this is ignored.
  final WidgetBuilder? nextButtonBuilder;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    Key? key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.config = const NumberPaginatorUIConfig(),
    this.contentBuilder,
    this.controller,
    this.showPrevButton = true,
    this.showNextButton = true,
    this.prevButtonContent = const Icon(Icons.chevron_left),
    this.nextButtonContent = const Icon(Icons.chevron_right),
    this.prevButtonBuilder,
    this.nextButtonBuilder,
  })  : assert(initialPage >= 0),
        assert(initialPage <= numberPages - 1),
        super(key: key);

  @override
  NumberPaginatorState createState() => NumberPaginatorState();
}

class NumberPaginatorState extends State<NumberPaginator> {
  late NumberPaginatorController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? NumberPaginatorController();
    _controller.currentPage = widget.initialPage;
    _controller.addListener(() {
      widget.onPageChange?.call(_controller.currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedNumberPaginator(
      numberPages: widget.numberPages,
      initialPage: widget.initialPage,
      onPageChange: _controller.navigateToPage,
      config: widget.config,
      child: SizedBox(
        height: widget.config.height,
        child: Row(
          mainAxisAlignment: widget.config.mainAxisAlignment,
          children: [
            if (widget.showPrevButton)
              widget.prevButtonBuilder?.call(context) ??
                  PaginatorButton(
                    onPressed: _controller.currentPage > 0 ? _controller.prev : null,
                    child: widget.prevButtonContent,
                  ),
            ..._buildCenterContent(),
            if (widget.showNextButton)
              widget.nextButtonBuilder?.call(context) ??
                  PaginatorButton(
                    onPressed:
                        _controller.currentPage < widget.numberPages - 1 ? _controller.next : null,
                    child: widget.nextButtonContent,
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCenterContent() {
    return [
      if (widget.contentBuilder != null)
        Container(
          padding: widget.config.contentPadding,
          child: widget.contentBuilder!(_controller.currentPage),
        )
      else if (widget.config.mode != ContentDisplayMode.hidden)
        Expanded(
          child: Container(
            padding: widget.config.contentPadding,
            child: PaginatorContent(
              currentPage: _controller.currentPage,
            ),
          ),
        ),
    ];
  }
}
