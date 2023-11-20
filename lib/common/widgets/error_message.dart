import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final errorProvider = StateProvider.autoDispose<Exception?>((ref) => null);
final errorTypeProvider = StateProvider.autoDispose<String>((ref) => 'warning');

showCustomSnackbar(
  BuildContext context,
  WidgetRef ref,
  String message,
  SnackBarPosition position,
) {
  final errorType = ref.read(errorTypeProvider);
  Widget errorWidget;
  if (errorType == 'error') {
    errorWidget = MyCustomSnackbar.error(
      message: message,
    );
  } else if (errorType == 'success') {
    errorWidget = MyCustomSnackbar.success(
      message: message,
    );
  } else {
    errorWidget = MyCustomSnackbar.warning(
      message: message,
    );
  }
  showTopSnackBar(
    Overlay.of(context),
    errorWidget,
    snackBarPosition: position,
  );
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];
const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));

class MyCustomSnackbar extends StatefulWidget {
  const MyCustomSnackbar.success({
    Key? key,
    required this.message,
    this.messagePadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff00E676),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const MyCustomSnackbar.info({
    Key? key,
    required this.message,
    this.messagePadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const MyCustomSnackbar.error({
    Key? key,
    required this.message,
    this.messagePadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const MyCustomSnackbar.warning({
    Key? key,
    required this.message,
    this.messagePadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    this.icon = const Icon(
      Icons.warning_amber_outlined,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color.fromARGB(255, 255, 153, 0),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;

  @override
  State<MyCustomSnackbar> createState() => _MyCustomSnackbarState();
}

class _MyCustomSnackbarState extends State<MyCustomSnackbar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      // height: 80,
      constraints: const BoxConstraints(minHeight: 80),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: widget.iconPositionTop,
            left: widget.iconPositionLeft,
            child: SizedBox(
              height: 95,
              child: Transform.rotate(
                angle: widget.iconRotationAngle * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: widget.messagePadding,
              child: Text(
                widget.message,
                style: theme.textTheme.bodyMedium?.merge(widget.textStyle),
                textAlign: widget.textAlign,
                overflow: TextOverflow.ellipsis,
                // maxLines: widget.maxLines,
                maxLines: 14,
                textScaleFactor: widget.textScaleFactor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
