import 'package:flutter/material.dart';
import 'package:habit_helper_app/goals_page.dart';
import 'package:habit_helper_app/habit.dart';
import 'package:habit_helper_app/new_habit_page.dart';
import 'package:habit_helper_app/statistics_page.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white24//Could use this for diff color -> const Color(0xFFEFEFEF)
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var checked = const Icon(Icons.check_box_outlined);
var unchecked = const Icon(Icons.check_box_outline_blank);
List<bool> checkboxes = <bool>[];
//final List<Icon> checkboxes = <Icon>[];
List<bool> activated = <bool>[];
final List<String> entries = <String>[];
final List<Habit> habits = <Habit>[];

List<String> daysOfTheWeek = <String>[];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }  void _invertChecked() {
    _counter++;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    int today = DateTime.now().subtract(Duration(days:1)).day;
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().subtract(Duration(days:4))).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().subtract(Duration(days:3))).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().subtract(Duration(days:2))).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().subtract(Duration(days:1))).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now()).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().add(Duration(days:1))).toString());
    daysOfTheWeek.add(DateFormat('EEEE').format(DateTime.now().add(Duration(days:2))).toString());

    if(habits.isEmpty && false){
      for(var i = 0; i < 15; i++) {
        habits.add(Habit("  Habit $i"));
        //checkboxes.add(Icon(Icons.check_box_outline_blank));
        checkboxes.add(false);
      }
    }

    void _navigateAndReturnSelection(BuildContext context) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateHabitPage(title: 'New Habit')),
      );
      habits.add(Habit(result));
      checkboxes.add(false);
      setState(() {});
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Column(
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    daysOfTheWeek[0].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[1].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[2].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[3].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[4].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[5].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    daysOfTheWeek[6].substring(0,3),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),Container(
            height: 20,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (today-3).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    (today-2).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    (today-1).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    today.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    (today+1).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
    (today+2).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
    (today+3).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height) - 200,
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: habits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      print("Tapped $index");
                      checkboxes[index] = !checkboxes[index];
                      setState(() {});
                    },
                  title: Container(
                    height: 50,
                    color: Colors.white60,
                    child: Row(
                        children: <Widget>[
                          checkboxes[index] ? checked : unchecked,
                          Text(
                            "  " + habits[index].name,
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
                  MaterialPageRoute(builder: (context) => StatisticsPage(title: 'Statistics', habits: habits)),
                );
                setState(() {});
              },
              icon: const Icon(Icons.navigate_before_rounded, size: 18),
              label: const Text("Stats"),
            ),
          ),
          const SizedBox(width: 50), // give it width
          Expanded(
            flex: 20,
            child: ElevatedButton(
              onPressed: () {
                _navigateAndReturnSelection(context);
                setState(() {});
              },
              child: const Icon(Icons.add, size: 18),
            ),
          ),
          const SizedBox(width: 50), // give it width
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
              icon: const Text("Goals"),
              label: const Icon(Icons.navigate_next_rounded, size: 18),
            ),
          ),
        ]
      ),
    );
  }
}
