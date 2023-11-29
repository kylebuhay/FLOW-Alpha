import 'package:test2/hive_tasks.dart';

import 'SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'SettingsPage.dart'; // Import your SettingsPage
import 'TimerPage.dart';
import 'AddTask.dart';
import 'EditTask.dart';
import 'boxes.dart';
import 'tasks.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'CreateTimer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(hivetasksAdapter());
  boxHive_tasks = await Hive.openBox<hive_tasks>('hive_taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _mounted = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // controller for timer
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController secondController = TextEditingController();


  List<dynamic> user_tasks = [];

  // @override
  // void dispose() {
  //
  //   nameController.dispose();
  //   descController.dispose();
  //
  //   hourController.dispose();
  //   minuteController.dispose();
  //   secondController.dispose();
  //
  //   super.dispose();
  // }

  void setTasks({String taskName = '', String taskDesc = ''}) {
    tasks task = tasks(name: taskName, desc: taskDesc);

    if (_mounted) {
      setState(() {
        user_tasks ??= [];
        user_tasks.add(task);
      });
    }
  }

  Widget taskManager(tasks task) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(0),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xf99ac5d3),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color(0xff000000), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              task.name,
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
    );
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Your To-Do's",
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
        currentIndex: 1,
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
          if (index == 2) {
            // Index 2 corresponds to the Settings icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          } else if (index == 0) {
            // Timer
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => TimerPage()),
            // );


            Alert(
                context: context,
                title: "Set Timer",
                content: Column(
                  children: <Widget>[
                  SingleChildScrollView(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: CreateTimer(hourController: hourController, minuteController: minuteController, secondController: secondController,)
                      )
                  )
                  ],
                ),
                buttons: [
                  DialogButton(
                    // onPressed: () => Navigator.pop(context),
                    onPressed: () {
                      // Call setTimer when the user presses "Start"
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Start",
                      style:
                      TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]).show();

          }
        },
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image(
            image: const AssetImage("assets/resting_pana1.png"),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                // LIST TASKS
                // child: ListView.builder(
                //   itemCount: user_tasks.length,
                //   itemBuilder: (context, index) {
                //     return taskManager(user_tasks[index]);
                //   },
                // ),
                child: ListView.builder(
                  itemCount: boxHive_tasks.length,
                  itemBuilder: (context, index) {
                    hive_tasks tasks = boxHive_tasks.getAt(index);
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff9ac5d3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: const Color(0xff000000), width: 1),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              boxHive_tasks.deleteAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                        title: Text(tasks.name),
                        subtitle: const Text('Name'),
                        trailing: Text('desc: ${tasks.desc}'),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xff272a2f),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Alert(
                            context: context,
                            // type: AlertType.warning,
                            title: "Modify Task",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {

                                  Alert(
                                      context: context,
                                      title: "Add New Task",
                                      content: Column(
                                        children: <Widget>[
                                          TextField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                              helperText: 'Name of Task',
                                              // labelText: '',
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          TextField(
                                            maxLines: 5,
                                            controller: descController,
                                            decoration: InputDecoration(
                                              helperText: 'Task Description',
                                              // labelText: '',
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      buttons: [
                                        DialogButton(
                                          onPressed: () {

                                            nameController.clear();
                                            descController.clear();

                                            Navigator.pop(context);
                                          },
                                          color: Color.fromRGBO(149, 26, 26, 1.0),
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        DialogButton(
                                          // onPressed: () => Navigator.pop(context),
                                          onPressed: () {
                                            // setTimer(); // Call setTimer when the user presses "Start"
                                            // SAVE TASK
                                            // setTasks(taskName: nameController.text, taskDesc: descController.text);
                                            setState(() {
                                              boxHive_tasks.put(
                                                'key_${nameController.text}',
                                                hive_tasks(
                                                    name: nameController.text,
                                                    desc: descController.text),
                                              );
                                            });
                                            Navigator.pop(context);
                                          },
                                          color: Color.fromRGBO(51, 149, 26, 1.0),
                                          child: Text(
                                            "Save",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        )
                                      ]).show();
                                },
                                color: Color.fromRGBO(51, 149, 26, 1.0),
                              ),
                            ],
                          ).show();
                        },
                        color: const Color(0xffffffff),
                        iconSize: 13,
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
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
