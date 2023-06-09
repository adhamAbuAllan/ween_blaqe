import '../api/cities.dart';
import '../api/type_of_apartment.dart';
import '../api/users.dart';

class AddAdDataContainer {
  static String? address;

  static User? ownerId;
  static int? bathRooms;
  static int? rooms;

  static int? price;
  static int? countOfStudent;
  static int? squareMeters;

  /*
  *
  * don't delete those commands I will active after know
  * how save data of dropdown button
  * --------------------------------
  *  static TypeOfApartment? typOfApartmentId;
    static City? cityId;
    * ----------------------------
  * */

  static String? title;
  static String? description;
  static String? city;
  static String? type;
  static List<int>? advantages;


  // static int ? cityId ;

// AddAdDataContainer({key? key,this})  : super(key:key);
// AddAdDataContainer({
//   this.address
// });
// AddAdDataContainer({this.address });

  static void printValues() {
    //
    // print (address);
    // print(bathRooms);
    // print (rooms);
    // print (price);
    // print (currentCityId);
    // print(typOfApartmentId);
    // print(  description);
  }
}