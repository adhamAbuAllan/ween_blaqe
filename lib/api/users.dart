import 'dart:core';
import 'package:ween_blaqe/api/type_of_user.dart';
import 'package:ween_blaqe/api/universities.dart';


//
// class UserRes {
//   UserRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final User data;
//
//   UserRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//         // data = (json['data'] == null ? null : User?.fromJson(json['data']))!;
//     //
//     data = User.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//         _data['data'] = data == null ? null : data.toJson();
//
//
//     // _data['data'] = data.toJson();
//     return _data;
//   }
// }
// //     data = json['data'] == null ? null : User?.fromJson(json['data']);
//
// //     _data['data'] = data == null ? null : data?.toJson();
//
// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.university,
//     required this.type,
//     required this.token,
//     required this.gender,
//   });
//   late final int id;
//   late final String name;
//   late final String phone;
//   late final University university;
//   late final TypeOfUser type;
//   late final String token;
//   late final String gender;
//   // late final String email;
//
//   User.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     university = University.fromJson(json['university_id']);
//     type = TypeOfUser.fromJson(json['type_id']);
//     token = json['token'];
//     gender = json['gender'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['phone'] = phone;
//     _data['university_id'] = university.toJson();
//     _data['type_id'] = type.toJson();
//     _data['token'] = token;
//     _data['gender'] = gender;
//     return _data;
//   }
// }




class UserRes {
  UserRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final User data;

  UserRes.fromJson(Map<String, dynamic> json){
    status = json['status']??false;
    msg = json['msg']??"general error";
    data = User.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
            /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------
                 required this.university,
                  required this.type,
             * -------------------------------------------------
             */
    required this.token,
    required this.gender,
    required this.type,
    required this.university,
    required this.createAt
  });
  late final int id;
  late final String name;
  late final String phone;
             /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------
               late final University university;
               late final TypeOfUser type;
             * -------------------------------------------------
             */
  late final String token;
  late final String gender;
  late final String university;
  late final String type;
  late final String  createAt;
  //

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];

            /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------
                university = University.fromJson(json['university_id']);
              // type = TypeOfUser.fromJson(json['type_id']);
             * -------------------------------------------------
             */
    token = json['token'];
    gender = json['gender'];
    university = json['university'];
    type = json['type'];
    createAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
            /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------
              _data['university'] = university.toJson();
              _data['type'] = type.toJson();
             * -------------------------------------------------
             */

    _data['token'] = token;
    _data['gender'] = gender;
    _data['type'] = type;
    _data['university'] = university;
    _data['created_at'] = createAt;
    return _data;
  }
}

class University {
  University({
    required this.id,
    required this.name,

  });
  late final int id;
  late final String name;


  University.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;

    return _data;
  }
}

class TypeOfUser {
  TypeOfUser({
    required this.id,
    required this.name,

  });
  late final int id;
  late final String name;


  TypeOfUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;

    return _data;
  }
}