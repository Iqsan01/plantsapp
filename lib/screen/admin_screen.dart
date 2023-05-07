import 'package:flutter/material.dart';
import 'package:plantapps/page/about_page.dart';
import 'package:plantapps/page/admin_home.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AdminScreens());
  }
}

class AdminScreens extends StatefulWidget {
  const AdminScreens({Key? key}) : super(key: key);

  @override
  _AdminScreensState createState() => _AdminScreensState();
}

class _AdminScreensState extends State<AdminScreens> {
  int _selectedNavbar = 0;

  final List<Widget> _children = [AdminHome(), AboutPage()];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: _children[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Exit'),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
