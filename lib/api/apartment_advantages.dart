
class ApartmentAdvantage{
  ApartmentAdvantage({
    required this.id,
    required this.apartmentId,
    required this.advantageId,

    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final int apartmentId;
  late final int advantageId;
  // late final List<Advantages> advantages;
  late final Null createdAt;
  late final Null updatedAt;

  ApartmentAdvantage.fromJson(Map<String, dynamic> json){
    id = json['id'];
    apartmentId = json['apartment_id'];
    advantageId = json['advantage_id'];
    // advantages = List.from(json['advantages']).map((e)=>Advantages.fromJson(e)).toList();

    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['apartment_id'] = apartmentId;
    _data['advantage_id'] = advantageId;
    // _data['advantages'] = advantages.map((e)=>e.toJson()).toList();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
