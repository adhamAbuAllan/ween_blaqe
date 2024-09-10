// import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

import '../api/users.dart';

import 'new_session.dart';
saveUserInfo(User data,{DataOfOneApartment ? apartment } ) {
  NewSession.save("logged", "OK");
  // if(apartmentModelController.ownerToken!=null){
  //   NewSession.save("token", apartmentModelController.ownerToken);
  //   debugPrint("the token of owner is ${apartmentModelController.ownerToken}");
  //
  // }
  NewSession.save<int>("id", data.id);
  NewSession.save<String>("token", data.token??"null");
  // Session.save("profile", data.profile);

  NewSession.save("name", data.name);

  /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------

  // NewSession.save("type_id", data.type.id);
  // NewSession.save("university_id", data.university.id);

  -------------------------------------------------
*/

  // NewSession.save("type", data.type);
  NewSession.save("phone", data.phone);
  NewSession.save("apartmentId",apartment?.id??-1 );
  // NewSession.save("countryPhoneNumberId", data.)
  // NewSession.save("gender", data.gender);
  // NewSession.save("university", data.university);


}
//


removeUserInfo() {
  NewSession.remove("logged");
  NewSession.remove("token");
  NewSession.remove("id");
  // Session.remove("profile");
  NewSession.remove("name");
  // NewSession.remove("gender");
  NewSession.remove("type_id");
  NewSession.remove('phone');
  // NewSession.remove("university_id");
}

// saveUserInfoOfTeach(User data) {
//   NewSession.save("logged", "OK");
//   // NewSession.save("token", data.token);
//   NewSession.save<int>("id", data.id);
//   // Session.save("profile", data.profile);
//   NewSession.save("name", data.name);
// }
//
// removeUserInfoOfTeach() {
//   NewSession.remove("logged");
//   NewSession.remove("token");
//   NewSession.remove("id");
//   // Session.remove("profile");
//   NewSession.remove("name");
// }
//
