
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/pages/listpoject.dart';

class pagepoject extends StatefulWidget {
  @override
  _pagepojectState createState() => _pagepojectState();
}

class _pagepojectState extends State<pagepoject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context,innerboxscrollview){
          return<Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: true,

              centerTitle: true,
              backgroundColor: Colors.black12,
              toolbarHeight:80,
              leading: IconButton(
                icon: Icon(Icons.search,color: Colors.blue,),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings,color: Colors.blue,),
                ),


              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network("https://app.jobchat.vn/wp-content/uploads/2020/10/Quan-ly-cong-viec-va-KPIs.jpg",fit: BoxFit.cover,),

              ),
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,bottom: 24,right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,

                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal:24 ,vertical: 0),
                      hintText: "search here",
                      prefixIcon:Icon(Icons.search),

                    ),

                  ),
                ),
                preferredSize: Size.fromHeight(100),
              )
            )


          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Poject",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 50,),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),
                listitempoject("https://tse3.mm.bing.net/th?id=OIP.YMMhezRX1_Ugd8gdg5tU6wHaEK&pid=Api&P=0&w=276&h=156","bds long an","11-10-2020","12-22020"),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
