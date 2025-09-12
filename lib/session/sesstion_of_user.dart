// import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../api/users.dart';

import '../constants/strings.dart';
import 'new_session.dart';

saveUserInfo(User data, {DataOfOneApartment? apartment}) {
  NewSession.save(PrefKeys.logged, "OK");
  // if(apartmentModelController.ownerToken!=null){
  //   NewSession.save("token", apartmentModelController.ownerToken);
  //   debugPrint("the token of owner is ${apartmentModelController.ownerToken}");
  //
  // }
  NewSession.save<int>(PrefKeys.id, data.id ?? -1);
  NewSession.save<String>(PrefKeys.token, data.token ?? "null");
  // Session.save("profile", data.profile);

  NewSession.save(PrefKeys.name, data.name);

  /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------

  // NewSession.save("type_id", data.type.id);
  // NewSession.save("university_id", data.university.id);

  -------------------------------------------------
*/

  // NewSession.save("type", data.type);
  NewSession.save(PrefKeys.phone, data.phone);
  NewSession.save(PrefKeys.profile, data.profile);
  NewSession.save(PrefKeys.apartmentId, apartment?.id ?? -1);
  NewSession.save(PrefKeys.facebook, data.facebook);
  NewSession.save(PrefKeys.email, data.email);
  NewSession.save(PrefKeys.createdAt, data.timeAgoCreated);

  // NewSession.save("countryPhoneNumberId", data.)
  // NewSession.save("gender", data.gender);
  // NewSession.save("university", data.university);
}
//

removeUserInfo() {
  NewSession.remove(PrefKeys.logged);
  NewSession.remove(PrefKeys.token);
  NewSession.remove(PrefKeys.id);
  NewSession.remove(PrefKeys.profile);
  NewSession.remove(PrefKeys.facebook);
  NewSession.remove(PrefKeys.email);
  NewSession.remove(PrefKeys.name);
  // NewSession.remove("gender");
  NewSession.remove(PrefKeys.typeId);
  NewSession.remove(PrefKeys.phone);
  NewSession.remove(PrefKeys.createdAt);
  // NewSession.remove("university_id");
}

// saveUserInfoOfTeach(User data) {
//   NewSession.save(PrefKeys.logged", "OK");
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
