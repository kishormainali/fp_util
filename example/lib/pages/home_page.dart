import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedColumn.spaced(
      padding: const EdgeInsets.all(30),
      children: [
        const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 36,
          ),
        ),
        FilledButton(
          onPressed: () {
            Logger.d("Hello");
            FpSnackbar.success(context, message: 'Hello');
          },
          child: const Text('Show Success Snackbar'),
        ),
      ],
    );
  }
}

class HomePageNavbar extends StatelessWidget {
  const HomePageNavbar({
    super.key,
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('FPUtil Examples'),
        ),
        body: shell,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(0),
                ),
              ),
              ListTile(
                title: const Text('Snackbar'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(1),
                ),
              ),
              ListTile(
                title: const Text('Pickers'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(2),
                ),
              ),
              ListTile(
                title: const Text('Form'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(3),
                ),
              ),
              ListTile(
                title: const Text('Bottomsheet'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(4),
                ),
              ),
              ListTile(
                title: const Text('Extensions'),
                onTap: () => _handleDrawerTap(
                  context,
                  () => shell.goBranch(5),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.message),
              label: 'Snackbar',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              label: 'Pickers',
            ),
            NavigationDestination(
              icon: Icon(Icons.format_align_center),
              label: 'Form',
            ),
          ],
          onDestinationSelected: shell.goBranch,
          selectedIndex: shell.currentIndex,
        ),
      ),
      desktop: (context) => Scaffold(
        body: _WebBody(shell: shell),
      ),
    );
  }

  void _handleDrawerTap(BuildContext context, VoidCallback callback) {
    callback();
    Navigator.pop(context);
  }
}

class _WebBody extends StatelessWidget {
  const _WebBody({
    required this.shell,
  });
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.message),
              label: Text('Snackbar'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today),
              label: Text('Pickers'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.format_align_center),
              label: Text('Form'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.vertical_align_bottom_sharp),
              label: Text('Bottomsheet'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.extension),
              label: Text('Extensions'),
            ),
          ],
          selectedIndex: shell.currentIndex,
          onDestinationSelected: shell.goBranch,
          labelType: NavigationRailLabelType.all,
        ),
        const VerticalDivider(),
        Expanded(child: shell),
      ],
    );
  }
}
