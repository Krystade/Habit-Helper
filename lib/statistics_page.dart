import 'package:flutter/material.dart';
import 'package:habit_helper_app/goals_page.dart';
import 'package:habit_helper_app/habit.dart';
import 'package:habit_helper_app/main.dart';
import 'package:habit_helper_app/new_habit_page.dart';

class StatisticsPage extends StatefulWidget {
  final List<Habit> habits;

  const StatisticsPage({Key? key, required this.title, required this.habits}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
    );
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        // Here we take the value from the StatisticsPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Text(
              "Streaks:",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height) - 200,
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: habits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Container(
                        height: 50,
                        color: Colors.white60,
                        child: Row(
                            children: <Widget>[
                              Text(
                                  " \uD83D\uDD25 " + habits[index].streak.toString() + "\t-\t" + habits[index].name,
                                  style: const TextStyle(fontSize: 25)
                              ),
                            ]
                        ),
                      )
                  );
                }
            ),
          ),

        ],

      ),
      bottomNavigationBar: Row(
          children: <Widget>[
            Expanded(
              flex: 25,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoalPage(title: 'Goals', habits: habits)),
                  );
                  setState(() {});
                },
                icon: Icon(Icons.navigate_before_rounded, size: 18),
                label: Text("Goals"),
              ),
            ),
            SizedBox(width: 50), // give it width
            Expanded(
              flex: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateHabitPage(title: 'New Habit')),
                  );
                  setState(() {});
                },
                child: Icon(Icons.add, size: 18),
              ),
            ),
            SizedBox(width: 50), // give it width
            Expanded(
              flex: 25,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
                  );
                  setState(() {});
                },
                icon: Text("Home"),
                label: Icon(Icons.navigate_next_rounded, size: 18),
              ),
            ),
          ]

      ),
    );
  }
}