import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fp_util/src/snackbars/snackbar_position.dart';

import '_snackbar_utils.dart';

class RawSnackbar extends StatefulWidget {
  const RawSnackbar({
    super.key,
    required this.child,
    required this.animationDuration,
    required this.snackbarDuration,
    this.animationCurve,
    required this.autoDismiss,
    required this.snackbarPosition,
    required this.scaleFactor,
    required this.position,
    required this.onRemove,
  });

  final Widget child;
  final Duration animationDuration;
  final Duration snackbarDuration;
  final Curve? animationCurve;
  final bool autoDismiss;
  final SnackbarPosition snackbarPosition;
  final double scaleFactor;
  final double position;

  final Function() onRemove;

  @override
  RawSnackbarState createState() => RawSnackbarState();
}

class RawSnackbarState extends State<RawSnackbar> {
  final GlobalKey positionedKey = GlobalKey();

  Widget getChildBasedOnDismiss(Widget child) {
    return Animate(
      onComplete: (controller) {
        if (widget.autoDismiss) {
          widget.onRemove();
        }
      },
      effects: [
        SlideEffect(
          begin: widget.snackbarPosition.beginOffset,
          end: Offset.zero,
          duration: Duration(milliseconds: 2 * widget.animationDuration.inMilliseconds),
          curve: widget.animationCurve ?? Curves.elasticOut,
        ),
        FadeEffect(
          duration: widget.animationDuration,
          begin: 0,
          end: 1,
        ),
        if (widget.autoDismiss)
          SlideEffect(
            delay: widget.snackbarDuration,
            duration: const Duration(milliseconds: 300),
            curve: widget.animationCurve ?? Curves.easeInOut,
            begin: Offset.zero,
            end: const Offset(0, 2),
          )
      ],
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.vertical,
        onDismissed: (direction) {
          widget.onRemove();
        },
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.animationDuration.inMilliseconds),
      key: positionedKey,
      curve: Curves.easeIn,
      top: widget.snackbarPosition.topMargin(context, widget.position),
      bottom: widget.snackbarPosition.bottomMargin(context, widget.position),
      left: calculateMargin(context),
      right: calculateMargin(context),
      child: Material(
        color: Colors.transparent,
        child: AnimatedScale(
          duration: widget.animationDuration,
          curve: Curves.bounceOut,
          scale: widget.position == 0 ? 1 : widget.scaleFactor,
          child: getChildBasedOnDismiss(widget.child),
        ),
      ),
    );
  }
}
