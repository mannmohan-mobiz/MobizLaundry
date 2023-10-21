import 'dart:convert';

import 'package:http/http.dart' as http;
// String baseUrl = "http://68.183.94.11:90/";
String baseUrl = "http://bijoy.pythonanywhere.com/";

class AuthData {
  static final AuthData _instance = AuthData._internal();

  factory AuthData() {
    return _instance;
  }

  AuthData._internal();

  String? user_token;
  String? user_type;
  String? response;
  int? user_id;

  void setData(String token, String userType, int userId) {
    user_token = token;
    user_type = userType;
    user_id = userId;
  }

  void clearData() {
    user_token = null;
    user_type = null;
    user_id = null;
  }

  void clearResponse() {
    response = null;
  }

  void logout() async {
    var resp = await http.get(Uri.parse(baseUrl+'accounts/logout_api'));
    response = jsonDecode(resp.body)['message'];
  }
}

