



//test
//     final post = postFromJson(jsonString);
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

// class Apartment{
//   int id;
//   String title;
//   int price;
//   String location ;
//   Bookings is_booking;
//   int city_id;
//   String rooms;
//   String bathrooms;
//   TypeOfApartment  type_id;
//   int square_metres ;
//   String description;
//   int owner_id;
//   Apartment({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.location,
//     required this.is_booking,
//     required this.city_id,
//     required this.rooms,
//     required this.bathrooms,
//     required this.type_id,
//     required this.square_metres,
//     required this.description,
//     required this.owner_id,
//   }
//   );
//
//
//
//   //
//   // factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
//   //   id: json["id"],
//   //   title: json["title"],
//   //   is_booking: json["is_booking"],
//   //   city_id: json["city_id"],
//   //   rooms: json["rooms"],
//   //   bathrooms: json["bathrooms"],
//   //   type_id: json["type_id"],
//   //   square_metres: json["square_metres"],
//   //   description: json["description"],
//   //   owner_id: json["owner_id"],
//   //   location: json["location"],
//   //   price: json["price"],
//   // );
//   //
//   // Map<String, dynamic> toJson() => {
//   //   "id": id,
//   //   "title": title,
//   //   "is_booking": is_booking,
//   //   "city_id": city_id,
//   //   "rooms": rooms,
//   //   "bathrooms":bathrooms,
//   //   "type_id": type_id,
//   //   "square_metres": square_metres,
//   //   "description": description,
//   //   "owner_id": owner_id,
//   //   "location": location,
//   //   "price": price,
//   //
//   // };
//
// }






// class ApartmentRes {
//   ApartmentRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final Apartment ?data;
//
//   ApartmentRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = json['data'] == null ? null :Apartment?.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data == null ? null : data?.toJson();
//     return _data;
//   }
// }
//
// class Apartment {
//   Apartment({
//     required this.title,
//     required this.price,
//     required this.rooms,
//     required this.location,
//     required this.bathrooms,
//     required this.squareMeters,
//     required this.description,
//     required this.typeId,
//     required this.cityId,
//     required this.ownerId,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//   });
//   late final String title;
//   late final String price;
//   late final String rooms;
//   late final String location;
//   late final String bathrooms;
//   late final String squareMeters;
//   late final String description;
//   late final String typeId;
//   late final String cityId;
//   late final int ownerId;
//   late final String updatedAt;
//   late final String createdAt;
//   late final int id;
//
//   Apartment.fromJson(Map<String, dynamic> json){
//
//     title = json['title'];
//     price = json['price'];
//     rooms = json['rooms'];
//     location = json['location'];
//     bathrooms = json['bathrooms'];
//     squareMeters = json['square_meters'];
//     description = json['description'];
//     typeId = json['type_id'];
//     cityId = json['city_id'];
//     ownerId = json['owner_id'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['title'] = title;
//     _data['price'] = price;
//     _data['rooms'] = rooms;
//     _data['location'] = location;
//     _data['bathrooms'] = bathrooms;
//     _data['square_meters'] = squareMeters;
//     _data['description'] = description;
//     _data['type_id'] = typeId;
//     _data['city_id'] = cityId;
//     _data['owner_id'] = ownerId;
//     _data['updated_at'] = updatedAt;
//     _data['created_at'] = createdAt;
//     _data['id'] = id;
//     return _data;
//   }
// }

// class ApartmentRes {
//   ApartmentRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final List<Apartment> data;
//
//   ApartmentRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>Apartment.fromJson(e)).toList();
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


// class Apartment {
//   Apartment({
//     required this.id,
//     // required this.owner,
//     // required this.isBooking,
//     required this.rooms,
//     required this.bathrooms,
//     required this.squareMeters,
//     required this.title,
//     required this.description,
//     required this.location,
//     required this.price,
//     required this.city,
//     required this.type,
//     // required this.updatedAt,
//     // required this.createdAt,
//   });
//   late final int id;
//
//
//   // late final User owner;
//   // late final User owner;
//   //
//   //
//   // late final int isBooking;
//   late final int rooms;
//   late final int bathrooms;
//   late final int squareMeters;
//   late final String title;
//   late final String description;
//   late final String location;
//   late final String city;
//   late final String type;
//   late final int price;
// /*
// * be careful !!
// * don't delete those two lines is high important those two table in database
// * and have data you should use them after knew how to save data of dropdown button
// * in this class
// * ------------------
// *   late final City city;
//   late final TypeOfApartment type;
// * -----------------
// *
// * */
//
//
//
//   // late final String ?updatedAt;
//   // late final String? createdAt;
//
//
//   Apartment.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     // owner = User.fromJson(json['owner']);
//     // isBooking = json['is_booking'];
//     rooms = json['rooms'];
//     bathrooms = json['bathrooms'];
//     squareMeters = json['square_meters'];
//     title = json['title'];
//     description = json['description'];
//     location = json['location'];
//     price = json['price'];
//     type = json['type'];
//     city = json['city'];
//     /*
// * be careful !!
// * don't delete those two lines is high important those two table in database
// * and have data you should use them after knew how to save data of dropdown button
// * in this class
// * ------------------
// *   city = City.fromJson(json['city']);
//     type = TypeOfApartment.fromJson(json['type']);
// * -----------------
// *
// * */
//
//     // updatedAt = json['updated_at'];
//     // createdAt = json['created_at'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     // _data['owner'] = owner.toJson();
//     // _data['is_booking'] = isBooking;
//     _data['rooms'] = rooms;
//     _data['bathrooms'] = bathrooms;
//     _data['square_meters'] = squareMeters;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['location'] = location;
//     _data['price'] = price;
//     _data['type'] = type;
//     _data['city'] = city;
//
//     /*
// * be careful !!
// * don't delete those two lines is high important those two table in database
// * and have data you should use them after knew how to save data of dropdown button
// * in this class
// * ------------------
//    _data['city'] = city.toJson();
//     _data['type'] = type.toJson();
// * -----------------
// *
// * */
//
//     // _data['updated_at'] = updatedAt;
//     // _data['created_at'] = createdAt;
//     return _data;
//   }
// }








//
//
//
//
//
//
// class ApartmentsRes {
//   ApartmentsRes({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final List<ArrayOfApartments> data;
//
//   ApartmentsRes.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>ArrayOfApartments.fromJson(e)).toList();
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
// class ArrayOfApartments {
//   ArrayOfApartments({
//      this.id,
//      this.ownerId,
//      this.photos,
//      this.rooms,
//      this.bathrooms,
//      this.squareMeters,
//      this.title,
//      this.description,
//      this.location,
//      this.price,
//      this.city,
//      this.type,
//      // this.advantage,
//      this.countOfStudent,
//      this.phone,
//      this.updatedAt,
//   });
//   late final int? id;
//   late final int? ownerId;
//   late final List<Photos>? photos;
//   late final int? rooms;
//   late final int? bathrooms;
//   late final int ?squareMeters;
//   late final String ?title;
//   late final String ?description;
//   late final String ?location;
//   late final int ?price;
//   late final String ?city;
//   late final String? type;
//   // late final List<Advantage> ?advantage;
//   late final int? countOfStudent;
//   late final String ?phone;
//   late final String ?updatedAt;
//
//   ArrayOfApartments.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     ownerId = json['owner_id'];
//     photos = List.from(json['photos']).map((e)=>Photos.fromJson(e)).toList();
//     rooms = json['rooms'];
//     bathrooms = json['bathrooms'];
//     squareMeters = json['square_meters'];
//     title = json['title'];
//     description = json['description'];
//     location = json['location'];
//     price = json['price'];
//     city = json['city'];
//     type = json['type'];
//     // advantage = List.from(json['advantage']).map((e)=>Advantage.fromJson(e)).toList();
//     countOfStudent = json['count_of_student'];
//     phone = json['phone'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['owner_id'] = ownerId;
//     _data['photos'] = photos?.map((e)=>e.toJson()).toList();
//     _data['rooms'] = rooms;
//     _data['bathrooms'] = bathrooms;
//     _data['square_meters'] = squareMeters;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['location'] = location;
//     _data['price'] = price;
//     _data['city'] = city;
//     _data['type'] = type;
//     // _data['advantage'] = advantage?.map((e)=>e.toJson()).toList();
//     _data['count_of_student'] = countOfStudent;
//     _data['phone'] = phone;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }





































//
//
//
// ApartmentsRes apartmentPetsFromJson(String str)=>ApartmentsRes.fromJson(json.decode(str));
// String apartmentPetsToJson(ApartmentsRes data) => json.encode(data.toJson());
//
// class ApartmentsRes {
//   ApartmentsRes({
//     this.status,
//     this.msg,
//     required this.data,
//   });
//
//   final List<ArrayOfApartments> data;
//   factory ApartmentsRes.fromJson(Map<String, dynamic> json) => ApartmentsRes(
//     data: List<ArrayOfApartments>.from(json["data"].map((x) => ArrayOfApartments.fromJson(x))),
//   );
//   late final bool ?status;
//   late final String? msg;
//   // late final List<ArrayOfApartments>data;
//
//   // ApartmentsRes.fromJson(Map<String, dynamic> json){
//   //   status = json['status'];
//   //   msg = json['msg'];
//   //   data = List.from(json['data']).map((e)=>ArrayOfApartments.fromJson(e)).toList();
//   // }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// // Map<String, dynamic> toJson() => {
// //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
// // };
//
// }
//
// class ArrayOfApartments {
//   ArrayOfApartments({
//     this.id,
//     this.ownerId,
//     this.rooms,
//     this.photos,
//     this.bathrooms,
//     this.squareMeters,
//     this.title,
//     this.description,
//     this.location,
//     this.price,
//     this.city,
//     this.type,
//     this.countOfStudent,
//     this.firstImage
//     // required this.updatedAt,
//   });
//   late final int ? id;
//   // late final User?owner;
//   late final int?ownerId;
//   late final int ? rooms;
//   late  final List<Photos> ? photos;
//
//   late final int ? bathrooms;
//   late final int ? squareMeters;
//   late final String ? title;
//   late final String ? description;
//   late final String ? location;
//   late final int ? price;
//   late final String ? city;
//   late final String ? type;
//   late final String ? firstImage;
//   late final int ? countOfStudent;
//   late final String ? updatedAt;
//
//   ArrayOfApartments.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     // owner = User.fromJson(json['owner']);
//     ownerId = json['owner_id'];
//     photos = List.from(json['photos']).map((e)=>Photos.fromJson(e)).toList();
//
//     rooms = json['rooms'];
//     bathrooms = json['bathrooms'];
//     squareMeters = json['square_meters'];
//     title = json['title'];
//     description = json['description'];
//     location = json['location'];
//     price = json['price'];
//     city = json['city'];
//     type = json['type'];
//     countOfStudent = json['count_of_student'];
//     firstImage = json['first_image'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     // _data['owner'] = owner?.toJson();
//     _data['owner_id'] = ownerId;
//     _data['photos'] = photos!.map((e)=>e.toJson()).toList();
//
//     _data['rooms'] = rooms;
//     _data['bathrooms'] = bathrooms;
//     _data['square_meters'] = squareMeters;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['location'] = location;
//     _data['price'] = price;
//     _data['city'] = city;
//     _data['type'] = type;
//     _data['count_of_student'] = countOfStudent;
//     _data['first_image'] = firstImage;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

class Owner {
  Owner({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
    // required this.university,
    // required this.type,
    // required this.active,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String gender;
  // late final int university;
  // late final int type;
  // late final int active;
  late final String createdAt;
  late final String updatedAt;

  Owner.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    // university = json['university'];
    // type = json['type'];
    // active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['gender'] = gender;
    // _data['university'] = university;
    // _data['type'] = type;
    // _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}


// class Photos {
//   Photos({
//     required this.id,
//     required this.url,
//     required this.apartmentId,
//     required this.active,
//     // required this.createdAt,
//     // required this.updatedAt,
//   });
//   late final int id;
//   late final String url;
//   late final int apartmentId;
//   late final int active;
//   // late final String createdAt;
//   // late final String updatedAt;
//
//   Photos.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     url = json['url'];
//     apartmentId = json['apartment_id'];
//     active = json['active'];
//     // createdAt = json['created_at'];
//     // updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['url'] = url;
//     _data['apartment_id'] = apartmentId;
//     _data['active'] = active;
//     // _data['created_at'] = createdAt;
//     // _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }











//
//
//
//
// class OneApartment {
//   OneApartment({
//     this.status,
//     this.msg,
//     this.data,
//   });
//   late final bool ?status;
//   late final String? msg;
//   late final DataOfOneApartment ?data;
//
//   OneApartment.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = DataOfOneApartment.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data?.toJson();
//     return _data;
//   }
// }
//
// class DataOfOneApartment {
//   DataOfOneApartment({
//     required this.id,
//     required this.rooms,
//     required this.bathrooms,
//     required this.squareMeters,
//     required this.title,
//     required this.description,
//     required this.location,
//     required this.price,
//     required this.city,
//     required this.type,
//     required this.updatedAt,
//   });
//   late final int id;
//   late final int rooms;
//   late final int bathrooms;
//   late final int squareMeters;
//   late final String title;
//   late final String description;
//   late final String location;
//   late final int price;
//   late final String city;
//   late final String type;
//   late final String updatedAt;
//
//   DataOfOneApartment.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     rooms = json['rooms'];
//     bathrooms = json['bathrooms'];
//     squareMeters = json['square_meters'];
//     title = json['title'];
//     description = json['description'];
//     location = json['location'];
//     price = json['price'];
//     city = json['city'];
//     type = json['type'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['rooms'] = rooms;
//     _data['bathrooms'] = bathrooms;
//     _data['square_meters'] = squareMeters;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['location'] = location;
//     _data['price'] = price;
//     _data['city'] = city;
//     _data['type'] = type;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }
//
