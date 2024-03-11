String removeZeroNumber(String value){
  value =  value.replaceFirst(RegExp('0'), '');
  // print(value);
  return value;

}
