import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogAction {
  final Widget title;
  final VoidCallback onPressed;

  DialogAction(this.title, this.onPressed);
}

abstract class DialogData {
  final Widget? title;
  final Widget content;
  final List<Widget> actions;

  DialogData({
    this.title,
    required this.content,
    this.actions = const [],
  });
}
