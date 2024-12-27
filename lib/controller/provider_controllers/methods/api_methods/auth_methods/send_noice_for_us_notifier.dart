import 'dart:convert';

import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../../../api/comments.dart';
import '../../../../../constants/strings.dart';
class SendNoticeForUsNotifier extends StateNotifier<AuthState> {
  SendNoticeForUsNotifier() : super(AuthState());
  sendNotice(String comment) async {
    var uri = Uri.parse(ServerWeenBalaqee.commentAdd);
    var request = await http.post(uri, body: {
      "comment": comment,
// "type_id":insetType,
      // "type_id":typeOfUser.id
    });
    var json = await jsonDecode(request.body);
    var response = Comment.fromJson(json);
      response.comment = comment;
  }

  
}
