class TypeOfApartmentRes {
  TypeOfApartmentRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final TypeOfApartment data;

  TypeOfApartmentRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = TypeOfApartment.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }

}

class TypeOfApartment {
  TypeOfApartment({
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  late final String? name;
  late final String? updatedAt;
  late final String? createdAt;
  late final int? id;

  TypeOfApartment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }

  @override
  String toString() {
    return toJson().toString();
  }

}
