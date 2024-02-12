import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

import '../constants/sizes.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    super.key,
    this.title,
    required this.message,
    required this.backgroundColor,
    this.textStyle,
    this.titleTextStyle,
    this.action,
    required this.centerText,
    this.contentMaxLines,
  });

  final Color backgroundColor;
  final String? title;
  final String message;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;

  /// snackbar action
  final Widget? action;

  final bool centerText;
  final int? contentMaxLines;

  TextAlign get textAlign => centerText ? TextAlign.center : TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: 10.circularBorderRadius,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title.isNotNullNotEmpty) ...[
            Text(
              title!,
              style: titleTextStyle,
              textAlign: textAlign,
            ),
            Sizes.gap8,
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: textStyle,
                  maxLines: contentMaxLines,
                  overflow: contentMaxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
                  textAlign: textAlign,
                ),
              ),
              if (action != null) ...[
                Sizes.gap8,
                action!,
              ]
            ],
          ),
        ],
      ),
    );
  }
}
