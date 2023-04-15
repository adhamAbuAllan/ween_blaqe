import 'dart:core';
import 'package:ween_blaqe/api/universities.dart';
import 'package:ween_blaqe/api/type_of_apartment.dart';
import 'package:ween_blaqe/api/photos.dart';
import 'package:ween_blaqe/api/cities.dart';



// class User {
//   int id ;
//   String name ;
//   TypeOfApartment type ;
//   String about_the_user;
//   String major;
//   Universities university;
//   String phone;
//   String password ;
//   Photos profile;
//   bool is_active;
//   int gender;
//   City city_id ;
//   User({required this.id,
//     required this.name,
//     required this.type,
//     required this.about_the_user,
//     required this.phone,
//     required this.password,
//     required this.is_active,
//     required this.gender,
//     required this.city_id,
//     required this.profile,
//     required this.major,
//     required this.university
//
//   });
//
// }




class UserRes {
  UserRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final User? data;

  UserRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = json['data'] == null ? null : User?.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data == null ? null : data?.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.type,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final int type;
  late final String token;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['type'] = type;
    _data['token'] = token;
    return _data;
  }
}




// class UserTest {
//   UserTest({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final Data data;
//
//   UserTest.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.type,
//     required this.token,
//   });
//   late final int id;
//   late final String name;
//   late final String phone;
//   late final int type;
//   late final String token;
//
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     type = json['type'];
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['phone'] = phone;
//     _data['type'] = type;
//     _data['token'] = token;
//     return _data;
//   }
// }