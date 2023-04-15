import 'package:ween_blaqe/api/users.dart';
import 'package:ween_blaqe/api/apartments.dart';


class Bookings{
  int id;
  UserRes user_id;
  Apartment apartment_id;
  int price;
  int months;
  DateTime from_date;
  DateTime to_date;
  int total_price;
  int status ;
  Bookings({required this.id,
    required this.user_id,
    required this.apartment_id,
    required this.price,
    required this.months,
    required this.from_date,
    required this.to_date,
    required this.total_price,
    required this.status,
  });

}