import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shake/shake.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

import 'AboutFlowPage.dart';
import 'main.dart';
import 'TimerPage.dart';

int ctr = 0;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
    bool shakeIsSwitched = false;
    late ShakeDetector shakeDetector;

    bool blockNotisIsSwitched = false;
    bool appNotisIsSwitched = false;

    @override
    void initState() {
        super.initState();
        // Initialize the shake detector
        shakeDetector = ShakeDetector.waitForStart(
            onPhoneShake: () {},
        );
    }

    @override
    void dispose() {
        shakeDetector?.stopListening();
        super.dispose();
    }

    void blockTheNotifs () async{
        if (blockNotisIsSwitched == true) {
            final isNotificationPolicyAccessGranted = await FlutterDnd.isNotificationPolicyAccessGranted;
            if (isNotificationPolicyAccessGranted != null && isNotificationPolicyAccessGranted) {
                await FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
            } else {
                FlutterDnd.gotoPolicySettings();
            }
            print("BLOCK NOTIFS. IS ON!");
        } else {
            print("BLOCK NOTIFS. IS OFF!");
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xffffffff),
            appBar: AppBar(
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: Color(0x003a57e8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                ),
                title: Text(
                    "Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        color: Color(0xff000000),
                    ),
                ),
            ),

            // 2. OOP, Polymorphism - Definition of different "BottomNavigationBar" items.
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.access_alarm),
                        label: 'Timer',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.document_scanner),
                        label: 'To-Do List',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                    ),
                ],
                backgroundColor: Color(0xff1e1e1e),
                currentIndex: 2,
                elevation: 8,
                iconSize: 21,
                selectedItemColor: Color(0xff47465d),
                unselectedItemColor: Color(0xff9e9e9e),
                selectedFontSize: 11,
                unselectedFontSize: 11,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: (index) {
                    // Handle bottom navigation tap
                    if (index == 1) {
                        // Index 2 corresponds to the Settings icon
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                    }else if(index == 0){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TimerPage()),
                        );
                    }
                },
            ),

            body: Stack(
                alignment: Alignment.topLeft,
                children: [
                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                        image: AssetImage("assets/flow_thoughts-pana-1.png"),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            child: Text(
                                                "About Us",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                    color: Color(0xff000000),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                            padding: EdgeInsets.all(0),
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffcbd8df),
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.zero,
                                                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                                            ),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                    Padding(
                                                        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                                                        child: Icon(
                                                            Icons.account_circle_outlined,
                                                            color: Color(0xff212435),
                                                            size: 20,
                                                        ),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                            "About Flow",
                                                            textAlign: TextAlign.left,
                                                            overflow: TextOverflow.clip,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 10,
                                                                color: Color(0xff000000),
                                                            ),
                                                        ),
                                                    ),
                                                    Container(
                                                        alignment: Alignment.center,
                                                        margin: EdgeInsets.all(0),
                                                        padding: EdgeInsets.all(0),
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Color(0x00000000),
                                                            shape: BoxShape.rectangle,
                                                            borderRadius: BorderRadius.zero,
                                                        ),
                                                        child: IconButton(
                                                            icon: Icon(Icons.arrow_forward_ios),
                                                            onPressed: () {
                                                                Navigator.push(
                                                                    context, MaterialPageRoute(builder: (context) => AboutFlowPage()));
                                                            },
                                                            color: Color(0xff212435),
                                                            iconSize: 10,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                            child: Text(
                                                "Device & Features",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14,
                                                    color: Color(0xff000000),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                    Container(
                                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                        padding: EdgeInsets.all(0),
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Color(0xffcbd8df),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.zero,
                                            border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                                Padding(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                                                    child: Icon(
                                                        Icons.vibration,
                                                        color: Color(0xff212435),
                                                        size: 20,
                                                    ),
                                                ),
                                                Expanded(
                                                    child: Text(
                                                        "Detect Shake",
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.clip,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 10,
                                                            color: Color(0xff000000),
                                                        ),
                                                    ),
                                                ),
                                                Switch(
                                                    value: shakeIsSwitched,
                                                    onChanged: (value) {
                                                        setState(() {
                                                            shakeIsSwitched = value;
                                                            if (shakeIsSwitched == true) {
                                                                shakeDetector.startListening();
                                                                print("SHAKE IS ON!");
                                                                shakeDetector = ShakeDetector.waitForStart(
                                                                    onPhoneShake: () {
                                                                        print("SHAKE SHAKE SHAKE SENORA $ctr");
                                                                        ctr++;
                                                                        Alert(
                                                                            context: context,
                                                                            // type: AlertType.warning,
                                                                            title: "Detected a shake!",
                                                                            desc: "Focus on your work.",
                                                                            buttons: [],
                                                                        ).show();
                                                                    },
                                                                    minimumShakeCount: 1,
                                                                    shakeSlopTimeMS: 3000, // detection interval per MS
                                                                    shakeCountResetTime: 1,
                                                                    shakeThresholdGravity: 2, // lakas ng shake
                                                                );
                                                            } else {
                                                                shakeDetector.stopListening();
                                                                void reset() {}
                                                                print("SHAKE IS OFF!");
                                                                ctr = 0;
                                                            }
                                                        });
                                                    },
                                                    activeTrackColor: Color(0xff141e26),
                                                    activeColor: Color(0xff47465d),
                                                    inactiveTrackColor: Color(0xff4d9e9e9e),
                                                    inactiveThumbColor: Color(0xff9e9e9e),
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                            padding: EdgeInsets.all(0),
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffcbd8df),
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.zero,
                                                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                                            ),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                    Padding(
                                                        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                                                        child: Icon(
                                                            Icons.cancel,
                                                            color: Color(0xff212435),
                                                            size: 20,
                                                        ),
                                                    ),
                                                    Text(
                                                        "Block Other Notifications",
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.clip,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 10,
                                                            color: Color(0xff000000),
                                                        ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            margin: EdgeInsets.all(0),
                                                            padding: EdgeInsets.all(0),
                                                            width: 68,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                color: Color(0x00000000),
                                                                shape: BoxShape.rectangle,
                                                                borderRadius: BorderRadius.zero,
                                                            ),
                                                        ),
                                                    ),
                                                    Switch(
                                                        value: blockNotisIsSwitched,
                                                        onChanged: (value) {
                                                            setState(() {
                                                                blockNotisIsSwitched = value;
                                                                blockTheNotifs();
                                                            });
                                                        },
                                                        activeTrackColor: Color(0xff141e26),
                                                        activeColor: Color(0xff47465d),
                                                        inactiveTrackColor: Color(0xff4d9e9e9e),
                                                        inactiveThumbColor: Color(0xff9e9e9e),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.all(0),
                                                        padding: EdgeInsets.all(0),
                                                        width: 0,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Color(0x00000000),
                                                            shape: BoxShape.rectangle,
                                                            borderRadius: BorderRadius.zero,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Container(
                                            margin: EdgeInsets.all(0),
                                            padding: EdgeInsets.all(0),
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffcbd8df),
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.zero,
                                                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                                            ),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                    Padding(
                                                        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                                                        child: Icon(
                                                            Icons.notifications,
                                                            color: Color(0xff212435),
                                                            size: 20,
                                                        ),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                            "Allow App Notifications",
                                                            textAlign: TextAlign.start,
                                                            overflow: TextOverflow.clip,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 10,
                                                                color: Color(0xff000000),
                                                            ),
                                                        ),
                                                    ),
                                                    Switch(
                                                        value: appNotisIsSwitched,
                                                        onChanged: (value) {
                                                            setState(() {
                                                                appNotisIsSwitched = value;
                                                                if (appNotisIsSwitched == true) {
                                                                    print("FLOW NOTIFS. IS ON!");
                                                                } else {
                                                                    print("FLOW NOTIFS. IS OFF!");
                                                                }
                                                            });
                                                        },
                                                        activeTrackColor: Color(0xff141e26),
                                                        activeColor: Color(0xff47465d),
                                                        inactiveTrackColor: Color(0xff4d9e9e9e),
                                                        inactiveThumbColor: Color(0xff9e9e9e),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.all(0),
                                                        padding: EdgeInsets.all(0),
                                                        width: 0,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Color(0x00000000),
                                                            shape: BoxShape.rectangle,
                                                            borderRadius: BorderRadius.zero,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}