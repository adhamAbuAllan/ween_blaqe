// class TypeOfUser {
//   TypeOfUser({
//     required this.id,
//     required this.name,
//     required this.active,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final String active;
//   late final String createdAt;
//   late final String updatedAt;
//
//   TypeOfUser.fromJson(Map<String, dynamic> json){
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