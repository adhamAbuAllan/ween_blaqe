class Photos {
  Photos({
     this.id,
     this.url,
     this.apartmentId,
     // this.active,
     this.createdAt,
     this.updatedAt,
  });
  late final int? id;
  late final String? url;
  late final int? apartmentId;
  // late final int ?active;
  late final String? createdAt;
  late final String ?updatedAt;

  Photos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    url = json['url'];
    apartmentId = json['apartment_id'];
    // active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['url'] = url;
    _data['apartment_id'] = apartmentId;
    // _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
