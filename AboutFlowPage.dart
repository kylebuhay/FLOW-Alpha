import 'package:flutter/material.dart';
import 'SettingsPage.dart';

class AboutFlowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
        elevation:0,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0x003a57e8),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Settings, About Us",
          style:TextStyle(
            fontWeight:FontWeight.w700,
            fontStyle:FontStyle.normal,
            fontSize:25,
            color:Color(0xff000000),
          ),
        ),
      ),
      body:
      Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        mainAxisSize:MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children:[

              ///***If you have exported images you must have to copy those images in assets/images directory.
              Image(
                image:AssetImage("assets/flow_meditation-pana 1.png"),
                height:MediaQuery.of(context).size.height * 0.45,
                width:MediaQuery.of(context).size.width,
                fit:BoxFit.contain,
              ),
            ],),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 0, 0, 15),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[


                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Text(
                      "Flow is a simple yet effective to-do and focus app ",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "that will help you get things done by breaking tasks ",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "into manageable loads and providing distraction-",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "free focus sessions anytime, anywhere.",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                  ],),
              ],),),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 0, 0, 45),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[


                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Text(
                      "It was developed by Nathaniel Ken Aquino, Kyle",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "Andrei Buhay, and Roj Gian Gorospe of 3CSC in ",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "partial fulfillment of the Final Academic Project of ",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                    Text(
                      "ICS26011: Mobile Applications Development.",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:17,
                        color:Color(0xff000000),
                      ),
                    ),
                  ],),
              ],),),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children:[

              MaterialButton(
                onPressed:(){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                color:Color(0xff141e26),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10.0),
                  side:BorderSide(color:Color(0xff808080),width:1),
                ),
                padding:EdgeInsets.all(16),
                child:Text("Back to Settings", style: TextStyle( fontSize:12,
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