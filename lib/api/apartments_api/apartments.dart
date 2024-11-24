import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ween_blaqe/api/advantages.dart';
import 'package:ween_blaqe/api/type_of_apartment.dart';

import '../cities.dart';
import '../photos.dart';
import '../users.dart';

class Apartments {
  Apartments({
    this.status,
    this.msg,
    this.data,
  });

  final bool? status;
  final String? msg;
  final List<DataOfOneApartment>? data;

  Apartments.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        msg = json['msg'],
        data = List.from(json['data']).map((e) => DataOfOneApartment.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
  }

  // Add the copyWith method here
  Apartments copyWith({
    bool? status,
    String? msg,
    List<DataOfOneApartment>? data,
  }) {
    return Apartments(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }
  @override
  String toString() {
    return 'Apartments(status: $status, msg: $msg, data: ${data?.map((e) => e.toString()).toList()})';
  }
}
class DataOfOneApartment {
  DataOfOneApartment(
      {this.id,
      this.owner,
      this.photos,
      this.advantages,
      this.rooms,
      this.bathrooms,
      this.squareMeters,
      this.title,
      this.description,
      this.location,
      this.price,
      this.city,
      this.type,
      this.updatedAt,
      this.countOfStudnet,
      this.timeAgo}){

currentPhotoIndex = 0.obs;
  }

  late final int? id;
  late final User? owner;
  late final List<Photos>? photos;
  late final List<Advantages>? advantages;
  late final int? rooms;
  late final int? bathrooms;
  late final int? squareMeters;
  late final String? title;
  late final String? description;
  late final String? location;
  late final int? price;
  late final City? city;
  late final TypeOfApartment? type;
  late final String? updatedAt;
  late final int? countOfStudnet;
  late final String? timeAgo;
  RxInt currentPhotoIndex = 0.obs;

  DataOfOneApartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = User.fromJson(json['owner']);
    photos = List.from(json['photos']).map((e) => Photos.fromJson(e)).toList();
    advantages = List.from(json['advantage'])
        .map((e) => Advantages.fromJson(e))
        .toList();
    rooms = json['rooms'];
    countOfStudnet = json['count_of_student'];
    bathrooms = json['bathrooms'];
    squareMeters = json['square_meters'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    city = City.fromJson(json['city']);
    type = TypeOfApartment.fromJson(json['type']);
    updatedAt = json['updated_at'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['owner'] = owner?.toJson();
    _data['photos'] = photos?.map((e) => e.toJson()).toList() ?? [];
    _data['advantage'] = advantages?.map((e) => e.toJson()).toList() ?? [];
    _data['rooms'] = rooms;
    _data['bathrooms'] = bathrooms;
    _data['square_meters'] = squareMeters;
    _data['title'] = title;
    _data['description'] = description;
    _data['location'] = location;
    _data['price'] = price;
    _data['count_of_student'] = countOfStudnet;
    _data['city'] = city?.toJson() ?? "";
    _data['type'] = type?.toJson() ?? "";
    _data['updated_at'] = updatedAt;
    _data['time_ago'] = timeAgo;
    return _data;
  }
  @override
  String toString() {
    return 'DataOfOneApartment(id: $id, title: $title, location: $location, price: $price, rooms: $rooms, bathrooms: $bathrooms, squareMeters: $squareMeters, city: ${city?.toString()}, type: ${type?.toString()})';
  }
}
