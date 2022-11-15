import 'package:diversity_challenge/screens/home_page.dart';
import 'package:diversity_challenge/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.not_interested),
            label: '',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.chat_bubble),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
                      decoration: BoxDecoration(
                          color: colorRed,
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: const Text("1",
                        textAlign: TextAlign.center,),
                    ),
                  ),
                )
              ],
            ),
            label: '',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline_outlined),
            label: '',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textTheme.headline6!.color,
        unselectedItemColor: Theme.of(context).hintColor,
        onTap: _onItemTapped,
        iconSize: 35,
      ),
    );
  }
}