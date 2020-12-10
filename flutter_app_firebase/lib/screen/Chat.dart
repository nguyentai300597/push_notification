

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/core/consts.dart';
import 'package:flutter_app_firebase/core/flutter_icons.dart';
import 'package:flutter_app_firebase/models/chat_model.dart';
import 'package:flutter_app_firebase/pages/chat_item_page.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class  Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State< Chat> {
  List<ChatModel> list = ChatModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white54,
                ),
                border:InputBorder.none
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatItemPage(),
                        ),
                      );
                    },
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),

                      ),
                      child: CircleAvatar(),
                    ),
                    title: Text(
                      list[index].contact.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    subtitle: list[index].isTyping
                        ? Row(
                      children: <Widget>[
                        SpinKitThreeBounce(
                          color: AppColors.blueColor,
                          size: 20.0,
                        ),
                      ],
                    )
                        : Row(
                      children: <Widget>[
                        Text(
                          list[index].lastMessage,
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(width: 25),
                        Text(
                          list[index].lastMessageTime + " days ago",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
Widget homechat()
{
  return  ListView.builder(
      shrinkWrap: true,
      itemCount:15,
      itemBuilder: (context,indext){
        return Dismissible(
          child:Card(
            child: Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 70,
                      height: 70,
                      child: CircleAvatar()),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text("user "+indext.toString()),
                          subtitle: Text("conntetn"),

                        ),
                        Text("tying...........")
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                      width: 30,
                      alignment: Alignment.center,

                      height: 30,

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red,),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("+10",))),
                ],
              ),
            ),
          ),
          key: ValueKey(indext),
          background: Container(
            color: Colors.blue,
            child: Icon(Icons.check),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
          ),
          onDismissed: (value){

          },


        );

      });
}
