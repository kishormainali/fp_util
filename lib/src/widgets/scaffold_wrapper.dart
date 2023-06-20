import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Wrapper around scaffold
class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    super.key,
    this.scaffoldKey,
    required this.body,
    this.useSafeArea = false,
    this.statusBarStyle = SystemUiOverlayStyle.dark,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.safeAreaLeft = true,
    this.safeAreaTop = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = true,
    this.safeAreaMinimum = EdgeInsets.zero,
    this.safeAreaMaintainBottomViewPadding = false,
  });

  /// use global key of scaffoldState to get state of scaffold
  final Key? scaffoldKey;

  /// theme mode for setting systemOverlayStatus
  final SystemUiOverlayStyle statusBarStyle;

  /// body of scaffold
  final Widget body;

  // default properties of start
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  // default properties end

  /// use this to true if you don't use appbar
  final bool useSafeArea;

  /// properties for safeArea
  /// add left padding for safe area
  /// this only effects if useSafeArea to true
  final bool safeAreaLeft;

  /// add top padding for safe area
  /// this only effects if useSafeArea to true
  final bool safeAreaTop;

  /// add right padding for safe area
  /// this only effects if useSafeArea to true\
  final bool safeAreaRight;

  /// add bottom padding for safe area
  /// this only effects if useSafeArea to true
  final bool safeAreaBottom;

  /// add minimum padding for safe area
  /// this only effects if useSafeArea to true
  final EdgeInsets safeAreaMinimum;

  /// flag for maintaining bottomViewPadding for safe area
  /// this only effects if useSafeArea to true
  final bool safeAreaMaintainBottomViewPadding;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyle,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          appBar: appBar,
          body: useSafeArea
              ? SafeArea(
                  left: safeAreaLeft,
                  top: safeAreaTop,
                  right: safeAreaRight,
                  bottom: safeAreaBottom,
                  minimum: safeAreaMinimum,
                  maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
                  child: body,
                )
              : body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          persistentFooterAlignment: persistentFooterAlignment,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        ),
      ),
    );
  }
}
