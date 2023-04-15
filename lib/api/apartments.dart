import 'package:ween_blaqe/api/bookings.dart';
import 'package:ween_blaqe/api/type_of_apartment.dart';
import 'dart:convert';
//test
//     final post = postFromJson(jsonString);

//
// List<Apartment> postFromJson(String str) => List<Apartment>
//     .from(json.decode(str)
//     .map((x) => Apartment(
//     id: id,
//     title: title,
//     price: price,
//     location: location,
//     is_booking: is_booking,
//     city_id: city_id,
//     rooms: rooms,
//     bathrooms: bathrooms,
//     type_id: type_id,
//     square_metres: square_metres,
//     description: description,
//     owner_id: owner_id).fromJson(x)));
// String postToJson(List<Apartment> data) => json.encode(List<dynamic>
//     .from(data.map((x) => x.toJson())));

class Apartment{
  int id;
  String title;
  int price;
  String location ;
  Bookings is_booking;
  int city_id;
  String rooms;
  String bathrooms;
  TypeOfApartment  type_id;
  int square_metres ;
  String description;
  int owner_id;
  Apartment({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.is_booking,
    required this.city_id,
    required this.rooms,
    required this.bathrooms,
    required this.type_id,
    required this.square_metres,
    required this.description,
    required this.owner_id,
  }
  );



  //
  // factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
  //   id: json["id"],
  //   title: json["title"],
  //   is_booking: json["is_booking"],
  //   city_id: json["city_id"],
  //   rooms: json["rooms"],
  //   bathrooms: json["bathrooms"],
  //   type_id: json["type_id"],
  //   square_metres: json["square_metres"],
  //   description: json["description"],
  //   owner_id: json["owner_id"],
  //   location: json["location"],
  //   price: json["price"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "title": title,
  //   "is_booking": is_booking,
  //   "city_id": city_id,
  //   "rooms": rooms,
  //   "bathrooms":bathrooms,
  //   "type_id": type_id,
  //   "square_metres": square_metres,
  //   "description": description,
  //   "owner_id": owner_id,
  //   "location": location,
  //   "price": price,
  //
  // };

}
