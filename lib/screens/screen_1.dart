import 'package:flutter/material.dart';
import 'package:flutterdietingui/tabScreens/home_tab.dart';

class Screen1 extends StatefulWidget {
  static const String name = "Screen1";

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          currentIndex: index,
          selectedItemColor: Colors.indigo,
          iconSize: 40.0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              title: Text(''),
            )
          ],
        ),
      ),
      body: ShowBody(index),
    );
  }
}

class ShowBody extends StatelessWidget {
  final int index;

  ShowBody(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return HomeTab();
        break;
      case 1:
        return HomeTab();
        break;
      case 2:
        return HomeTab();
        break;
      default:
        return null;
    }
  }
}
