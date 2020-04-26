enum CheckType{NULL_OR_EMPTY_VALUE,COMPARE_VALUE,EMAIL_FORMAT}
class Param {
  String key;
  String value;
  CheckType checkType;
  String valueConpare;
  Param({this.key, this.value,this.checkType = CheckType.NULL_OR_EMPTY_VALUE,this.valueConpare});
}