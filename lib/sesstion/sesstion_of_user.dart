import '../api/users.dart';
import 'main_session.dart';

saveUserInfo(User data) {
  Session.save("logged", "OK");
  Session.save("token", data.token);
  Session.saveInt("id", data.id);
  // Session.save("profile", data.profile);
  Session.save("name", data.name);
  Session.save("type", data.token);
}

removeUserInfo() {
  Session.remove("logged");
  Session.remove("token");
  Session.remove("id");
  // Session.remove("profile");
  Session.remove("name");
  Session.remove("type");
}

saveUserInfoOfTeach(User data) {
  Session.save("logged", "OK");
  Session.save("token", data.token);
  Session.saveInt("id", data.id);
  // Session.save("profile", data.profile);
  Session.save("name", data.name);
}

removeUserInfoOfTeach() {
  Session.remove("logged");
  Session.remove("token");
  Session.remove("id");
  // Session.remove("profile");
  Session.remove("name");
}