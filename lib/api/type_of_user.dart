class TypeOfUserRes {
  TypeOfUserRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final List<TypeOfUser> data;

  TypeOfUserRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>TypeOfUser.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TypeOfUser {
  TypeOfUser({
    required this.id,
    required this.productName,
     this.active,
     this.createdAt,
     this.updatedAt,
  });
  late final int id;
  late final String productName;
  late final int? active;
  late final String? createdAt;
  late final String ?updatedAt;

  TypeOfUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productName = json['product_name'];
    active = json['active']??1;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_name'] = productName;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}