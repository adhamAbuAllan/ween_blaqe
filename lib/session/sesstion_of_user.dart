// import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../api/users.dart';

import '../constants/strings.dart';
import 'new_session.dart';

Future<void> saveUserInfo(User data, {DataOfOneApartment? apartment}) async {
  await NewSession.save(PrefKeys.logged, "OK");
  // if(apartmentModelController.ownerToken!=null){
  //   NewSession.save("token", apartmentModelController.ownerToken);
  //   debugPrint("the token of owner is ${apartmentModelController.ownerToken}");
  //
  // }
  await NewSession.save<int>(PrefKeys.id, data.id ?? -1);
  await NewSession.save<String>(
    PrefKeys.token,
    data.token ?? NewSession.get(PrefKeys.token, ""),
  );
  // Session.save("profile", data.profile);

  await NewSession.save(PrefKeys.name, data.name ?? "");

  /*
             * be careful !!!
             * don't delete those two lines those tables of database
             * -------------------------------------------------

  // NewSession.save("type_id", data.type.id);
  // NewSession.save("university_id", data.university.id);

  -------------------------------------------------
*/

  // NewSession.save("type", data.type);
  await NewSession.save(PrefKeys.phone, data.phone ?? "");
  await NewSession.save(
    PrefKeys.profile,
    ServerWeenBalaqee.normalizePublicUrl(data.profile),
  );
  await NewSession.save(PrefKeys.apartmentId, apartment?.id ?? -1);
  await NewSession.save(PrefKeys.facebook, data.facebook ?? "");
  await NewSession.save(PrefKeys.email, data.email ?? "");
  await NewSession.save(PrefKeys.createdAt, data.timeAgoCreated ?? "");

  // NewSession.save("countryPhoneNumberId", data.)
  // NewSession.save("gender", data.gender);
  // NewSession.save("university", data.university);
}
//

Future<void> removeUserInfo() async {
  await NewSession.remove(PrefKeys.logged);
  await NewSession.remove(PrefKeys.token);
  await NewSession.remove(PrefKeys.id);
  await NewSession.remove(PrefKeys.profile);
  await NewSession.remove(PrefKeys.facebook);
  await NewSession.remove(PrefKeys.email);
  await NewSession.remove(PrefKeys.name);
  // NewSession.remove("gender");
  await NewSession.remove(PrefKeys.typeId);
  await NewSession.remove(PrefKeys.phone);
  await NewSession.remove(PrefKeys.createdAt);
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
