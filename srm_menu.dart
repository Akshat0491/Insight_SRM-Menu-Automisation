import 'dart:io';
import 'package:csv/csv.dart';
import 'package:collection/collection.dart';
void main() {
  int nonVegPrice=25;
  print("-->Modules Imported Successfully!");
  final file=File('janmenu.csv');
  final csvFile=const CsvToListConverter().convert(file.readAsStringSync());
  List<List<String>> arr=List.generate(csvFile[0].length, (i)=>[]);
  print("-->Empty list generated!");
  print(arr);

  for (var lines in csvFile){
    for (var i=0;i<lines.length; i++){
      arr[i].add(lines[i]);
    }
  }
  print("-->list updated succesffuly");
  print(arr);
  List<String> monBr =arr[0].sublist(3,8).where((x)=> x != '').toList();
  List<String> monLu =arr[0].sublist(9,15).where((x)=> x != '').toList();
  List<String> monDi =arr[0].sublist(16,23).where((x)=> x != '').toList();
  List<String> tueBr =arr[1].sublist(3,8).where((x)=> x != '').toList();
  List<String> tueLu =arr[1].sublist(9,15).where((x)=> x != '').toList();
  List<String> tueDi =arr[1].sublist(16,23).where((x)=> x != '').toList();
  List<String> wedBr =arr[2].sublist(3,8).where((x)=> x != '').toList();
  List<String> wedLu =arr[2].sublist(9,15).where((x)=> x != '').toList();
  List<String> wedDi =arr[2].sublist(16,23).where((x)=> x != '').toList();
  List<String> thuBr =arr[3].sublist(3,8).where((x)=> x != '').toList();
  List<String> thuLu =arr[3].sublist(9,15).where((x)=> x != '').toList();
  List<String> thuDi =arr[3].sublist(16,23).where((x)=> x != '').toList();
  List<String> friBr =arr[4].sublist(3,8).where((x)=> x != '').toList();
  List<String> friLu=arr[4].sublist(9,15).where((x)=> x != '').toList();
  List<String> friDi =arr[4].sublist(16,23).where((x)=> x != '').toList();
  List<String> satBr =arr[5].sublist(3,8).where((x)=> x != '').toList();
  List<String> satLu =arr[5].sublist(9,15).where((x)=> x != '').toList();
  List<String> satDi =arr[5].sublist(16,23).where((x)=> x != '').toList();
  List<String> sunBr =arr[6].sublist(3,8).where((x)=> x != '').toList();
  List<String> sunLu =arr[6].sublist(9,15).where((x)=> x != '').toList();
  List<String> sunDi =arr[6].sublist(16,23).where((x)=> x != '').toList();
  print("--> Each Meal's list made succesfully!");



  Map<String, Map<String, List<String>>> menu = {
    "Monday": {
      "Breakfast": monBr,
      "Lunch": monLu,
      "Dinner": [...monDi, "Non-Veg Price $nonVegPrice"]
    },
    "Tuesday": {
      "Breakfast": tueBr,
      "Lunch": tueLu,
      "Dinner": [...tueDi, "Egg Curry @10/-"]
    },
    "Wednesday": {
      "Breakfast": wedBr,
      "Lunch": wedLu,
      "Dinner": [...wedDi, "Non-Veg Price $nonVegPrice"]
    },
    "Thursday": {
      "Breakfast": thuBr,
      "Lunch": thuLu,
      "Dinner": [...thuDi, "Non-Veg Price $nonVegPrice"]
    },
    "Friday": {
      "Breakfast": friBr,
      "Lunch": friLu,
      "Dinner": [...friDi, "Non-Veg Price $nonVegPrice"]
    },
    "Saturday": {
      "Breakfast": satBr,
      "Lunch": satLu,
      "Dinner": [...satDi, "Non-Veg Price $nonVegPrice"]
    },
    "Sunday": {
      "Breakfast": sunBr,
      "Lunch": sunLu,
      "Dinner": [...sunDi, "Non-Veg Price $nonVegPrice"]
    }
  };
  print("--> Menu Updated Successfully!");
  print(menu);
  String dayDelimiter = "▮";
  String timeDelimiter = "⏺";
  String itemDelimiter = "⏹";

  String onePairDelimiter = "⦂";
  String twoPairDelimiter = "⧸";
  String threePairDelimiter = "⧹";
  String fourPairDelimiter = "⧺";

  String returnString = "";

  for (var day in menu.keys) {
    returnString += "$dayDelimiter$day$onePairDelimiter";
    for (var time in menu[day]!.keys) {
      returnString += "$timeDelimiter$time$twoPairDelimiter";
      for (var item in menu[day]![time]!) {
        returnString += "$itemDelimiter$item";
      }
    }
  }

  print(returnString);

}
