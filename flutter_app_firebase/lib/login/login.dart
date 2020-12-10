

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screen/Chat.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';



class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
 // List<post> ds=[];
  final _auth = FirebaseAuth.instance;

  final DatabaseReference _databaseReference=FirebaseDatabase.instance.reference().child("user");

  TextEditingController emailcontroler=new TextEditingController();
  TextEditingController passcontroler=new TextEditingController();
  bool showProgress = false;
 // List<ChatItemModel> chatItems = ChatItemModel.list;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    _databaseReference.once().then((DataSnapshot snapshot) {
      var key=snapshot.value.keys;
      var data=snapshot.value;
   //   ds.clear();

      setState(() {
     //   print("------${ds.length}-");
      });
    });
  }
  void sendata()
  {



    // _databaseReference.push().set({
    //
    //   "name":"nguyen ",
    //
    //   "date":"11-11-2020",
    //   "content":"thiss is posst",
    //   "img":["https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182"],
    //   "like":"15",
    //   "comment":"10"
    // });

    // _databaseReference.child("data").push().set({
    //
    //   "name":"nguyen ",
    //
    //   "mess":[{
    //     "senderId": "-MNJWcj3O78bSMoKqUGD",
    //    "message": "Hi Marti! do you have already reports?",
    //   },
    //     {
    //       "senderId": "-MNJWcj3O78bSMoKqUGD",
    //       "message": "Hi Marti! do you have already reports?",
    //     },{
    //       "senderId": "-MNJWcj3O78bSMoKqUGD",
    //       "message": "Hi Marti! do you have already reports?",
    //     },{
    //       "senderId": "-MNJWcj3O78bSMoKqUGD",
    //       "message": "Hi Marti! do you have already reports?",
    //     },{
    //       "senderId": "-MNJWcj3O78bSMoKqUGD",
    //       "message": "Hi Marti! do you have already reports?",
    //     }],
    //
    // });
    _databaseReference.child("data").push().set({
      "nameid":"-MNJWcj3O78bSMoKqUGD",
      "mess":""
    });
    _databaseReference.child("data").child("-MNK7nyepFklIXceYfER").child("mess").push().set({

      "senderId": "-MNJWcj3O78bSMoKqUGD",
      "message": "Hi Marti! do you have already reports?",
    });


    _databaseReference.child("user").child("-MNJWcj3O78bSMoKqUGD").update(
      {
        "name":"tainhuyen"
      }
    );

    _databaseReference.child("user").push().set(
        {
          "date":"00-11-1111",
          "email":"tainhuyen@gmail.com",
          "name":"tainhuyen"

        }
    );

        
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login Page",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: emailcontroler,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: passcontroler,
                  obscureText: true,
                  textAlign: TextAlign.left,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    SizedBox
                      (
                      width: 300,

                      child: Material(
                        elevation: 5,
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5.0),
                        child: MaterialButton(
                          onPressed: () async {
                            print(emailcontroler.text);
                            setState(() {
                              showProgress = true;
                            });


                            try{
                              final newUser = await _auth.signInWithEmailAndPassword(
                                  email: emailcontroler.text, password: passcontroler.text);
                              print(newUser.toString());
                              print(emailcontroler.text);

                              if (newUser != null) {
                                Fluttertoast.showToast(
                                    msg: "Login Successfull",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat()));

                                setState(() {
                                  showProgress = false;
                                });
                              }else{
                                Fluttertoast.showToast(
                                    msg: "Login fail",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                print("rong");
                                setState(() {
                                 // showProgress = false;
                                });
                              }

                            }
                            catch(e){

                            }
                          },
                          minWidth: 200.0,
                          height: 45.0,
                          child: Text(
                            "Login",
                            style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network("http://1.bp.blogspot.com/-KL5NxRS7sqY/Tjac52rFmpI/AAAAAAAAALw/WSL46Vc1ArA/s1600/Facebook_icon.jpg"),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 50,
                        height: 70,
                        child: Image.network("https://www.binefitstorage.com/wp-content/uploads/2017/02/social-google-plus-icon.png"),
                      ),
                    )
                  ],
                ),
                FlatButton(

                  color: Colors.blue,
                  onPressed: (){
                   sendata();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()));
                  },
                  child: Text("add data"),
                ),
                FlatButton(

                  color: Colors.blue,
                  onPressed: ()async{
                    final _auth = FirebaseAuth.instance;



                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: emailcontroler.text, password: passcontroler.text);
                      if (newUser != null) {
                       print("creat thanh cong");
                      }
                    }
                    catch (e)
                    {
                      print(e);
                    }
                  },
                  child: Text("create usser"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
