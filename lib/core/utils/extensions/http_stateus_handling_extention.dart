import 'package:http/http.dart' as http;

extension HttpStatusHandling on http.Response {
  bool isSuccess() {
    return this.statusCode >= 200 && this.statusCode < 300;
  }
}
