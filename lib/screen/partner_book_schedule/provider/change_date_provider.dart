import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChangeDateProvider extends ChangeNotifier{
  int dateIndex = 0;
  List<dynamic> dates;

  Future<void> getDate() async{
    if(dates==null){
      dates = List();
      final dowFormat = new DateFormat("EEEE","vi");
      final dateFormat = new DateFormat("dd/MM/yyyy");
      var now = new DateTime.now();
      for(int i =0;i<=6;i++){
        final date = now.add(new Duration(days: i));
        dates.add({'dow': dowFormat.format(date), 'date': dateFormat.format(date)});
      }
      print("getDate $dates");
    }
  }


  void onChangeDateIndex(val){
    this.dateIndex = val;
    notifyListeners();
  }

  void onReloadData(val){
    this.dateIndex = val;
    notifyListeners();
  }
}