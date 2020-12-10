

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listitempoject(String img,String name,String starttime,String endtime)
{
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)
      ),
      borderRadius: BorderRadius.circular(5)
    ),
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start
      ,
      children: [
        Text(
          name,style: TextStyle(
          color: Colors.red,fontSize: 20
        ),
        ),
        Row(
          children: [
            Text(
              starttime,style: TextStyle(
              color: Colors.white,fontSize: 20
            ),
            ),
            Text("->"),
            Text(
              endtime,style: TextStyle(
              color: Colors.white,fontSize: 20
            ),
            ),
          ],
        )

      ],
    ),

  );
}