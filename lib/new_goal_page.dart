import 'package:flutter/material.dart';
import 'package:habit_helper_app/habit.dart';
import 'package:habit_helper_app/main.dart';

class CreateGoalPage extends StatefulWidget {
  const CreateGoalPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CreateGoalPage> createState() => _CreateGoalPageState();
}
List<String> habitNames = [];

class _CreateGoalPageState extends State<CreateGoalPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    for(var i = 0; i < habits.length; i++){
      habitNames.add(habits[i].name);
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the CreateGoalPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "Complete ",
                  style: TextStyle(color: Colors.white),
            ),
                Text(
                  "[Dropdown] ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "[Dropdown] ",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "times a ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "[Dropdown] ",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ]
            ),
          ],
        ),
      ),
      bottomNavigationBar:

      ElevatedButton.icon(
        onPressed: (){
          Navigator.pop(context, nameController.text);
          setState(() {});
        },
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }
}