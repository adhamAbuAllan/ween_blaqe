// import 'dart:ffi';


import 'apartments_api/one_apartment.dart';


// class Booking{
//   int id;
//   UserRes user_id;
//   ApartmentRes apartment_id;
//   int price;
//   int months;
//   DateTime from_date;
//   DateTime to_date;
//   int total_price;
//   int status ;
//   Booking({required this.id,
//     required this.user_id,
//     required this.apartment_id,
//     required this.price,
//     required this.months,
//     required this.from_date,
//     required this.to_date,
//     required this.total_price,
//     required this.status,
//   });
//
// }




class BookingsRes {
  BookingsRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Bookings data;

  BookingsRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Bookings.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Bookings {
  Bookings({
    required this.apartment,
    required this.userId,
    required this.price,
    required this.fromDate,
    required this.toDate,
    required this.totalPrice,
    required this.monthCount
  });
  late final DataOfOneApartment apartment;
  late final int userId;
  late final int price;
  late final String fromDate;
  late final String toDate;
  late final int totalPrice;
  late final int monthCount;

  Bookings.fromJson(Map<String, dynamic> json){
    apartment = DataOfOneApartment.fromJson(json['apartment']);
    userId = json['user_id'];
    price = json['price'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    totalPrice = json['total_price'];
    monthCount = json['month_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['apartment'] = apartment.toJson();
    _data['user_id'] = userId;
    _data['price'] = price;
    _data['from_date'] = fromDate;
    _data['to_date'] = toDate;
    _data['total_price'] = totalPrice;
    _data['month_count'] = monthCount;
    return _data;
  }
}
