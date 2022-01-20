import 'package:flutter/material.dart';
import 'package:habit_helper_app/habit.dart';
import 'package:habit_helper_app/main.dart';
import 'package:habit_helper_app/new_goal_page.dart';
import 'package:habit_helper_app/statistics_page.dart';

class GoalPage extends StatefulWidget {
  final List<Habit> habits;
  const GoalPage({Key? key, required this.title, required this.habits}) : super(key: key);

  final String title;

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => StatisticsPage(title: 'Statistics', habits: habits)),
    );
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(),
      bottomNavigationBar: Row(
        children: <Widget>[
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
              icon: Icon(Icons.navigate_before_rounded, size: 18),
              label: Text("Home"),
            ),
          ),
          SizedBox(width: 50), // give it width
          Expanded(
            flex: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGoalPage(title: 'New Goal')),
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
                  MaterialPageRoute(builder: (context) => StatisticsPage(title: 'Stats', habits: habits)),
                );
                setState(() {});
              },
              icon: Text("Stats"),
              label: Icon(Icons.navigate_next_rounded, size: 18),
            ),
          ),
        ]

    ),
    );
  }
}