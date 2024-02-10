import 'package:example/pages/bottomsheets/bottomsheet_page.dart';
import 'package:example/pages/extensions/extensions_page.dart';
import 'package:example/pages/forms/form_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/pickers/pickers_page.dart';
import 'package:example/pages/snackbars/snackbar_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomePageNavbar(shell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/snackbar',
            builder: (context, state) => const SnackbarPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/pickers',
            builder: (context, state) => const PickersPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/form',
            builder: (context, state) => const FormPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/bottom-sheets',
            builder: (context, state) => const BottomSheetPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/extensions',
            builder: (context, state) => const ExtensionsPage(),
          ),
        ]),
      ],
    )
  ],
);
