class CityResponse {
  CityResponse({
    this.status,
    this.msg,
    this.data,
  });

  late final bool? status;
  late final String? msg;
  late final List<City>? data;

  CityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e) => City.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class City {
  City({
    this.id,
    this.name,
    // this.active,
    this.createdAt,
    this.updatedAt,
  });

  late final int? id;
  late final String? name;
  // late final int? active;
  late final String? createdAt;
  late final String? updatedAt;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    // _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}




// class CityRes {
//   CityRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final List<City> data;
//
//   CityRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>City.fromJson(e)).toList();
//     print("ths is data in cities class json : $data !!");
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class City {
//   City({
//     required this.id,
//     required this.name,
//      this.createdAt,
//      this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final String ? createdAt;
//   late final String ?updatedAt;
//
//   City.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }
