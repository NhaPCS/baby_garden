import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Baby {
  String id;
  String avatar;
  String name;
  Gender gender;
  String birthday;
  String healthIndex;
  String lastDayCheck;

  Baby(
      {Key key,
      this.id,
      this.avatar,
      this.name,
      this.gender,
      this.birthday,
      this.healthIndex,
      this.lastDayCheck});

  static Baby fromJson(dynamic data) {
    return Baby(
        id: data['id'],
        avatar: data['avatar'],
        name: data['name'],
        gender: data['gender'] == "1" ? Gender.male : Gender.female,
        birthday: data['birthday'],
        lastDayCheck: formatDate(data['date_test']));
  }

  static String formatDate(String date) {
    if (date == null) return '';
    print("DATE $date");
    try{
      DateTime inputDate = DateTime.parse(date);
      String formattedDate = DateFormat.yMd('vi').format(inputDate);
      return formattedDate;
    } on Exception catch(e) {
      return '';
    }
  }
}

enum Gender { male, female }
