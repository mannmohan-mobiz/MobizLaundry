import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:integrate_3screens/Utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/AuthModel/auth_model.dart';

final authData = AuthData();
class AuthRepository {
  Future<AuthModel> loginUser({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(
          Uri.parse(baseUrl+'accounts/login_api'),
        body: {
            "username": username.trim(),
            "password": password.trim(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = AuthModel.fromJson(jsonDecode(response.body));
        authData.setData(result.data.tokEn, result.data.userType, result.data.id, result.data.username);
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}