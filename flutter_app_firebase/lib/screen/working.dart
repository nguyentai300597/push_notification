
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/pages/hearder.dart';
import 'package:percent_indicator/percent_indicator.dart';


class working extends StatefulWidget {
  @override
  _workingState createState() => _workingState();
}

class _workingState extends State<working> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child:hearder() ,
            ),



           DraggableScrollableSheet(

             builder: (BuildContext context, ScrollController scrollController){
               return Container(

                 child: ListView.builder(
                     controller: scrollController,
                     itemCount: 5,
                     itemBuilder: (context,indext){
                       return Card(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("tieu de "+indext.toString(),style: TextStyle(color: Colors.red,fontSize: 30),),
                                 Text("ghi chu"),
                               ],
                             ),
                             CircularPercentIndicator(
                               radius: 100.0,
                               lineWidth: 13.0,
                               animation: true,
                               percent: 0.7,
                               center: new Text(
                                 "70.0%",
                                 style:
                                 new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                               ),
                               footer: new Text(
                                 "Sales this week",
                                 style:
                                 new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                               ),
                               circularStrokeCap: CircularStrokeCap.round,
                               progressColor: Colors.purple,
                             ),
                           ],
                         ),
                       );
                     }),
               );
             },
           )
          ],
        ),
      ),
    );
  }
}
