import 'package:shared_preferences/shared_preferences.dart';

class NewSession{

  static late SharedPreferences sp;

  static init() async{
    sp = await SharedPreferences.getInstance();
  }

  static save<T>(String key,T value){
    switch(value.runtimeType){
      case String: sp.setString(key, value as String); break;
      case int: sp.setInt(key, value as int); break;
      case double: sp.setDouble(key, value as double); break;
      case bool: sp.setBool(key, value as bool); break;
      case List<String>: sp.setStringList(key, value as List<String>); break;
    }
  }

  static T get<T>(String key,T def){
    switch(def.runtimeType){
      case String: return (sp.getString(key) ?? def) as T;
      case int: return (sp.getInt(key) ?? def) as T;
      case double: return (sp.getDouble(key) ?? def) as T;
      case bool: return (sp.getBool(key) ?? def) as T;
      case List<String>: return (sp.getStringList(key) ?? def) as T;
    }
    return def;
  }

  static remove(String key){
    sp.remove(key);
  }
}