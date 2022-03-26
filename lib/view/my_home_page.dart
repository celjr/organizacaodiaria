import 'package:flutter/material.dart';
import 'package:organizacaodiaria/view/create_organization_page.dart';
import 'day_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _pressNavBarBottom(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final _kTabPages = <Widget>[
      DayPage(screenSize: screenSize),
      CreateDayPage(screenSize: screenSize)
    ];
    final _kBottomNavBarItem = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create Day')
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _kTabPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: _kBottomNavBarItem,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          onTap: _pressNavBarBottom),
    );
  }
}
