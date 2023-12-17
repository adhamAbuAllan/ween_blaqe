import 'package:ween_blaqe/api/type_of_user.dart';

import 'country_phone_code.dart';

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
    status = json['status'];
    msg = json['msg'];
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
    required this.typeId,
    required this.countryPhoneNumberId,
    required this.createdAt,
    // required this.token,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final TypeOfUser typeId;
  late final CountryPhoneNumberId countryPhoneNumberId;
  late final String createdAt;
  // late final String token;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    typeId = TypeOfUser.fromJson(json['type_id']);
    countryPhoneNumberId = CountryPhoneNumberId.fromJson(json['country_phone_number_id']);
    createdAt = json['created_at'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['type_id'] = typeId.toJson();
    _data['country_phone_number_id'] = countryPhoneNumberId.toJson();
    _data['created_at'] = createdAt;
    // _data['token'] = token;
    return _data;
  }
}


