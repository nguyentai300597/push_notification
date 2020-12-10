

import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PushMessagingExample extends StatefulWidget {
  @override
  _PushMessagingExampleState createState() => _PushMessagingExampleState();
}

class _PushMessagingExampleState extends State<PushMessagingExample> {
  List<Message> messagesList;
  final String serverToken = '<Server-Token>';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _getToken() {
  _firebaseMessaging.getToken().then((token) {
  print("Device Token: $token");
  print("Device Token: ");
  });
  }
  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message);

      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);

      },
    );

  }
  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    String mMessage = data['message'];
    print("Title: $title, body: $body, message: $mMessage");
    setState(() {
      Message msg = Message(title, body, mMessage);
      messagesList.add(msg);
    });
  }
  Future<void> sendNotificationMessageToPeerUser(String body,String title,String receiverToken) async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAAc4Ttswo:APA91bHHSH6rwMveKvjXnnLVaKjpdEXS7ADmB8XepLltxlpUgA08wE7_q_YWIDmrduW9x_Z2vioYIodMfAnJldd5bhBA5FpGCY3Aj3Cj1rnsXbzV49UV3wz-bBBLM2e8L088m2pXctl0',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            "sound" : "default"
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          'to': receiverToken,
        },
      ),
    );

    final Completer<Map<String, dynamic>> completer =
    Completer<Map<String, dynamic>>();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        completer.complete(message);
      },
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
    _configureFirebaseListeners();
    print("run");
    messagesList=List<Message>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                  itemCount:null==messagesList?0: messagesList.length,
                  itemBuilder: (context,indext){

                  if(messagesList[indext].body==null)
                    {
                      return SizedBox();
                    }
                return Card(child: Container(
                    height: 50,
                    child: Text(messagesList[indext].body==null?"":messagesList[indext].body)));
              }),

              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.blueGrey,
                  child: Text("send"),
                  onPressed: (){

                    sendNotificationMessageToPeerUser("hi333", "hiiiii","c9prGvkhQ4Oa-D71DJmi8V:APA91bENwJJxRMtX67m_8-DvVRfZbEDcpsv7DyL4M32iuwBg9uKZ0i-2TnKTndKzFtMpKiuOxE7DcM3nt4XcL_V0SXWhCNbHkT0TibVXrW8lYYDx2Ju7nhiATw90LfHRMhiQX4Kg3cj_");

                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
class Message {
  String title;
  String body;
  String message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
