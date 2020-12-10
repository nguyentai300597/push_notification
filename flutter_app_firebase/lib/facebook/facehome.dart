


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/facebook/commons/const.dart';
import 'package:flutter_app_firebase/facebook/commons/utils.dart';
import 'package:flutter_app_firebase/facebook/controllers/FBCloudMessaging.dart';
import 'package:flutter_app_firebase/facebook/threadMain.dart';
import 'package:flutter_app_firebase/facebook/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class facehome extends StatefulWidget {
  @override
  _facehomeState createState() => _facehomeState();
}

class _facehomeState extends State<facehome>with TickerProviderStateMixin {
  TabController _tabController;
  MyProfileData myData;

  bool _isLoading = false;
  @override
  void initState() {
    FBCloudMessaging.instance.takeFCMTokenWhenAppLaunch();
    FBCloudMessaging.instance.initLocalNotification();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    _takeMyData();
    super.initState();
  }

  Future<void> _takeMyData() async{
    setState(() {
      _isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myThumbnail;
    String myName;
    if (prefs.get('myThumbnail') == null) {
      String tempThumbnail = iconImageList[Random().nextInt(50)];
      prefs.setString('myThumbnail',tempThumbnail);
      myThumbnail = tempThumbnail;
    }else{
      myThumbnail = prefs.get('myThumbnail');
    }

    if (prefs.get('myName') == null) {
      String tempName = Utils.getRandomString(8);
      prefs.setString('myName',tempName);
      myName = tempName;
    }else{
      myName = prefs.get('myName');
    }

    setState(() {
      myData = MyProfileData(
        myThumbnail: myThumbnail,
        myName: myName,
        myLikeList: prefs.getStringList('likeList'),
        myLikeCommnetList: prefs.getStringList('likeCommnetList'),
        myFCMToken: prefs.getString('FCMToken'),
      );
    });

    setState(() {
      _isLoading = false;
    });
  }
  void _handleTabSelection() => setState(() {});

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  void updateMyData(MyProfileData newMyData) {
    setState(() {
      myData = newMyData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Thread example'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          TabBarView(
              controller: _tabController,
              children: [
                ThreadMain(myData: myData,updateMyData: updateMyData,),
                UserProfile(myData: myData,updateMyData: updateMyData,),
              ]
          ),
          Utils.loadingCircle(_isLoading),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text('Thread'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            title: new Text('Profile'),
          ),
        ],
      ),
    );
  }
}
