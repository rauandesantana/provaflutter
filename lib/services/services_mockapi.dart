import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _url = "https://654a85521f197d51e4925c5d.mockapi.io";

// ============================================================================= Services Mock API
class $ServicesMockAPI {
  const $ServicesMockAPI();
  //////////////////////////////////////////////////////////////////////////////

  Future<bool?> signIn({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse("$_url/user/");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final userList = convert.jsonDecode(response.body) as List<dynamic>;

      for (var user in userList) {
        if (user["username"] == username) {
          if (user["password"] == password) {
            return true;
          } else {
            break;
          }
        }
      }
      return false;
    } else {
      return null;
    }
  }
}
