import 'package:flutter/material.dart';
import 'main.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:Row(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisSize:MainAxisSize.max,
        children:[


          Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [
              ///***If you have exported images you must have to copy those images in assets/images directory.
              Image(
                image:AssetImage("assets/Studying-pana 1.png"),
                height:MediaQuery.of(context).size.height * 0.4,
                width:MediaQuery.of(context).size.width,
                fit:BoxFit.cover,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  Text(
                    "Welcome to Flow!",
                    textAlign: TextAlign.center,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w700,
                      fontStyle:FontStyle.normal,
                      fontSize:30,
                      color:Color(0xff000000),
                    ),
                  ),
                ],),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:Text(
                  "Where your tasks and focus converge into  ",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:20,
                    color:Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 0, 0, 50),
                child:Text(
                  "a seamless stream of productivity.",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:20,
                    color:Color(0xff000000),
                  ),
                ),
              ),
              MaterialButton(
                onPressed:(){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                color:Color(0xff2f506a),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10.0),
                  side:BorderSide(color:Color(0xff808080),width:1),
                ),
                padding:EdgeInsets.all(16),
                child:Text("Get Started", style: TextStyle( fontSize:15,
                  fontWeight:FontWeight.w500,
                  fontStyle:FontStyle.normal,
                ),),
                textColor:Color(0xffffffff),
                height:40,
                minWidth:140,
              ),
            ],),
        ],),
    )
    ;}
}