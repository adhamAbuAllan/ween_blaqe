


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
     this.id,
     this.name,
     this.phone,
    this.profile,
     this.typeId,
   // required this.countryPhoneNumberId,
     this.timeAgoCreated,
     this.token,
  });
  late final int ? id;
  late final String ? name;
  late final String ? phone;
  late final String ? profile;
  late final String ? facebook;
  late final String ? email;
  late final int ?typeId;
 // late final CountryPhoneNumberId countryPhoneNumberId;
 //  late final String countryPhoneNumberId;
  late final String ? timeAgoCreated;
  late final String ? token;


  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    profile = json['profile'];
    facebook = json['facebook'];
    email = json['email'];

    typeId = json['type'];
    //countryPhoneNumberId = CountryPhoneNumberId.fromJson(json['country_phone_number_id']);
    timeAgoCreated = json['time_ago'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['facebook'] = facebook;
    _data['email'] = email;
    _data['profile'] = profile;
    _data['type'] = typeId;
  //  _data['country_phone_number_id'] = countryPhoneNumberId.toJson();
    _data["time_ago"] = timeAgoCreated;
    _data['token'] = token;
    return _data;
  }
}


