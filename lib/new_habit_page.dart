import 'package:flutter/material.dart';
import 'package:habit_helper_app/habit.dart';
import 'package:habit_helper_app/main.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the CreateHabitPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Input the name for your habit:\n",
                style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.white24,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Name Here'
              ),
            )
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