import 'package:flutter/material.dart';

class infor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(

      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              height: 300,
            ),
          ),

          Positioned(


            top: 150,
            left: 50,
            child: Card(
              child: Container(

                width: 300,
                height: 200,
                child: Column(
                  children: [

                    ListTile(
                      leading: Icon(Icons.adjust),
                      title: Text("thong tin"),
                    ),
                    ListTile(
                      leading: Icon(Icons.adjust),
                      title: Text("thong tin"),
                    ),
                    ListTile(
                      leading: Icon(Icons.adjust),
                      title: Text("thong tin"),
                    )
                  ],

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
