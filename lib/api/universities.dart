// class UniversityRes {
//   UniversityRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final List<University> data;
//
//   UniversityRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>University.fromJson(e)).toList();
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
// class University {
//   University({
//     required this.id,
//     required this.name,
//      this.active,
//      this.createdAt,
//      this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final int? active;
//   late final String ?createdAt;
//   late final String ?updatedAt;
//
//   University.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['active'] = active;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }