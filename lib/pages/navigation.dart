import 'package:flutter/material.dart';
import 'home.dart';
import 'merch.dart';
import 'artists.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(51, 102, 255, 1.0),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 206, 203, 203),
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.color_lens_outlined,
              color: Color.fromARGB(255, 206, 203, 203),
            ),
            icon: Icon(Icons.color_lens_sharp),
            label: 'Merch'
            ),
          NavigationDestination(
              selectedIcon: Icon(
              Icons.assignment_ind_outlined,
              color: Color.fromARGB(255, 206, 203, 203),
            ),
            icon: Icon(Icons.assignment_ind_sharp),
            label: 'Artists'
            ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        const MerchPage(),

        /// Artists page
        const ArtistsPage(),
      ][currentPageIndex],
    );
  }
}