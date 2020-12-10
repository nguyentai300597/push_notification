
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hearder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blueGrey,
      child: Column(
        children: [
          Text("date"),
          SizedBox(height: 120,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 100,


                alignment: Alignment.center,
                child: Text("12",style: TextStyle(fontSize: 50),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  border: Border.all(  color: Colors.amber,)
                ),



              ),
              Container(
                height: 100,
                width: 100,


                alignment: Alignment.center,
                child: Text("12",style: TextStyle(fontSize: 50),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  border: Border.all(  color: Colors.amber,)
                ),



              ),
              Container(
                height: 100,
                width: 200,


                alignment: Alignment.center,
                child: Text("2020",style: TextStyle(fontSize: 50),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  border: Border.all(  color: Colors.amber,)
                ),



              ),
            ],
          ),
        ],
      )


    );
  }
}

