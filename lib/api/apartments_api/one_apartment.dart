import 'package:ween_blaqe/api/advantages.dart';

import '../photos.dart';
import 'apartments.dart';

class OneApartment {
  OneApartment({
    this.status,
    this.msg,
    this.data,
  });

  late final bool? status;
  late final String? msg;
  late final List<DataOfOneApartment>? data;

  OneApartment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data'])
        .map((e) => DataOfOneApartment.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
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
      });

  late final int? id;
  late final Owner? owner;
  late final List<Photos>? photos;
  late final List<Advantages>? advantages;
  late final int? rooms;
  late final int? bathrooms;
  late final int? squareMeters;
  late final String? title;
  late final String? description;
  late final String? location;
  late final int? price;
  late final String? city;
  late final String? type;
  late final String? updatedAt;
  late final int? countOfStudnet;

  DataOfOneApartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = Owner.fromJson(json['owner']);
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
    city = json['city'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['owner'] = owner?.toJson();
    _data['photos'] = photos?.map((e) => e.toJson()).toList()??[];
    _data['advantage'] = advantages?.map((e) => e.toJson()).toList()??[];
    _data['rooms'] = rooms;
    _data['bathrooms'] = bathrooms;
    _data['square_meters'] = squareMeters;
    _data['title'] = title;
    _data['description'] = description;
    _data['location'] = location;
    _data['price'] = price;
    _data['count_of_student'] = countOfStudnet;
    _data['city'] = city;
    _data['type'] = type;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
