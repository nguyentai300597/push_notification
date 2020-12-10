import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screen/Chat.dart';
import 'package:flutter_app_firebase/screen/infomation.dart';
import 'package:flutter_app_firebase/screen/infor.dart';
import 'package:flutter_app_firebase/screen/poject.dart';
import 'package:flutter_app_firebase/screen/pushnoti.dart';
import 'package:flutter_app_firebase/screen/working.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget _selecpage(int selecitem)
  {
    switch(selecitem)
    {
      case 0:return pagepoject();
      case 1:return working();
      case 2:return Chat();
      case 3:return LoginPage();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _selecpage(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: BottomNavigationBar(

          backgroundColor: Colors.blueGrey,
          items: [
            BottomNavigationBarItem(
                icon: Stack(children: [
                  Icon(Icons.home,color: Colors.blueGrey,
                  ),
                  Positioned(
                    top: -10,
                      left: 10,
                      child: Text("2",style:TextStyle(color: Colors.red,fontSize: 20),))
                ],),
              title: Text("home")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list,color: Colors.blueGrey,),
                title: Text("home")
            ), BottomNavigationBarItem(
                icon: Icon(Icons.chat,color: Colors.blueGrey,),
                title: Text("messeage")
            ), BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle,color: Colors.blueGrey,),
                title: Text("infor")
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
