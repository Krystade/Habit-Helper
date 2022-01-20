class Habit {
  String name = "";
  DateTime now = DateTime.now();
  DateTime dateStarted =  DateTime.now();
  DateTime lastDayChecked = DateTime.now();
  int streak = 0;

  Habit(String name){
    this.name = name;
    dateStarted = DateTime(now.year, now.month, now.day);
    lastDayChecked = DateTime(now.year, now.month, now.day);
  }

  void setName(String newName){
    name = newName;
  }

  void updateDayChecked(){
    DateTime yesterday = DateTime.now().subtract(Duration(days:1));
    DateTime today = DateTime.now().subtract(Duration(days:1));
    if(lastDayChecked == DateTime(yesterday.year, yesterday.month, yesterday.day)){
      streak += 1;
    }else if(lastDayChecked != DateTime(today.year, today.month, today.day)){
      streak = 0;
    }else{
      streak = 1;
    }
    DateTime now = DateTime.now();
    lastDayChecked = DateTime(now.year, now.month, now.day);
  }

  Habit.fromJson(Map<String, dynamic> json):
        name = json['name'],
        dateStarted =  json['dateStarted'],
        lastDayChecked = json['lastDayChecked'],
        streak = json['streak'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'dateStarted': dateStarted,
        'lastDayChecked': lastDayChecked,
        'streak': streak,
      };

}