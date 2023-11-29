import 'dart:async';

import 'package:flutter/material.dart';
import 'SettingsPage.dart';
import 'main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateTimer extends StatefulWidget {
  final TextEditingController hourController;
  final TextEditingController minuteController;
  final TextEditingController secondController;

  CreateTimer({ required this.hourController, required this.minuteController, required this.secondController, super.key,
  });

  @override
  _CreateTimerState createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {



  bool controllersInitialized = false;


  late Duration countdownDuration = Duration(seconds: 0);

  Duration duration = Duration();
  Timer? timer;

  bool isCountdown = true;

  @override
  void initState() {
    super.initState();


    // startTimer();
    reset();
  }

  @override
  void dispose() {
    // widget.minuteController.dispose();
    // widget.hourController.dispose();
    // widget.secondController.dispose();

    super.dispose();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  void setTimer() {

    // Parse values from controllers
    int hours = int.tryParse(widget.hourController.text) ?? 0;
    int minutes = int.tryParse(widget.minuteController.text) ?? 0;
    int seconds = int.tryParse(widget.secondController.text) ?? 0;

    // Update the countdownDuration with parsed values
    countdownDuration =
        Duration(hours: hours, minutes: minutes, seconds: seconds);

    // Update the displayed time
    setState(() => duration = countdownDuration);

    // Optionally, you can print the new countdownDuration
    print('New Countdown Duration: $countdownDuration');
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(fontSize: 45),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Your Timer",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: Color(0xff000000),
          ),
        ),
      ),
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
        currentIndex: 0,
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
            widget.minuteController.dispose();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          } else if (index == 2) {
            widget.minuteController.dispose();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MaterialButton(
                  onPressed: () {
                    //SET TIMER ALERT
                    Alert(
                        context: context,
                        title: "Set Timer",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: widget.hourController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.hourglass_full),
                                labelText: 'Hour',
                              ),
                            ),

                            TextField(
                              keyboardType: TextInputType.number,
                              controller: widget.minuteController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.hourglass_top),
                                labelText: 'Minute',
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: widget.secondController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.hourglass_bottom),
                                labelText: 'Second',
                              ),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            // onPressed: () => Navigator.pop(context),
                            onPressed: () {
                              setTimer(); // Call setTimer when the user presses "Start"

                              widget.hourController.clear();
                              widget.minuteController.clear();
                              widget.secondController.clear();

                              Navigator.pop(context);
                            },
                            child: Text(
                              "Start",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  },
                  color: Color(0xffffffff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Color(0xff000000), width: 2.5),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Set Timer",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xff000000),
                  height: 40,
                  minWidth: 140,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/clock.png"),
                    height: 245,
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.contain,
                  ),
                  buildTime(),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(color: Color(0xff000000), width: 3),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {

                      startTimer();
                    },
                    color: Color(0xff212435),
                    iconSize: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0x1fffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x00ffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(color: Color(0xff000000), width: 3),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.circle),
                    onPressed: () {
                      // stop timer
                      stopTimer(resets: false);
                    },
                    color: Color(0xff212435),
                    iconSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}