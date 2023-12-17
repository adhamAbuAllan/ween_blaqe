
class CountryPhoneNumberId {
  CountryPhoneNumberId({
    required this.id,
    // required this.countryName,
    // required this.countryPhoneNumber,

      });
  late final int id;
 // late final String countryName;
  //late final String countryPhoneNumber;
  //late final String flag;

  CountryPhoneNumberId.fromJson(Map<String, dynamic> json){
    id = json['id'];
   // countryName = json['country_name'];
   // countryPhoneNumber = json['country_phone_number'];
    // = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    //_data['country_name'] = countryName;
    //_data['country_phone_number'] = countryPhoneNumber;
   // _data['flag'] = flag;
    return _data;
  }
}