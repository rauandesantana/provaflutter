import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _url = "https://654a85521f197d51e4925c5d.mockapi.io";

// ============================================================================= Services Mock API
class $ServicesMockAPI {
  const $ServicesMockAPI();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Sign In
  Future<bool?> signIn({
    required String username,
    required Digest password,
  }) async {
    final uri = Uri.parse("$_url/user");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final userList = convert.jsonDecode(response.body) as List<dynamic>;

      for (var user in userList) {
        if (user["username"] == username) {
          if (user["password"] == password.toString()) {
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

  // --------------------------------------------------------------------------- Sign Up
  Future<bool> signUp({
    required String username,
    required Digest password,
  }) async {
    final uri = Uri.parse("$_url/user");
    final userExist = await _checkUserExist(username);

    if (userExist) return false;

    final response = await http.post(
      uri,
      body: {
        "username": username,
        "password": password.toString(),
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // --------------------------------------------------------------------------- Check User Exist
  Future<bool> _checkUserExist(String username) async {
    final uri = Uri.parse("$_url/user");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final userList = convert.jsonDecode(response.body) as List<dynamic>;

      for (var user in userList) {
        if (user["username"] == username) {
          return true;
        }
      }
    }

    return false;
  }
}
