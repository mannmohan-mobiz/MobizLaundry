import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:golden_falcon/Utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/AuthModel/auth_model.dart';

final authData = AuthData();
class AuthRepository {

  Future<AuthModel> loginUser({required String username, required String password}) async {
    print('#######12333');
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(
          Uri.parse(baseUrl+'accounts/login_api'),
        body: {
            "username": username.trim(),
            "password": password.trim(),
        },
      );
      print('#######RESPONSE${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('#######RESPONSE1#${response.body}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print('#######RESPONSE2#${response.body}');
        var result = AuthModel.fromJson(jsonDecode(response.body));
        print('#######RESPONSE3$result');
        authData.setData(result.data.tokEn, result.data.userType, result.data.id, result.data.username);
        prefs.setString('userId', result.data.id.toString());
        prefs.setString('userToken', result.data.tokEn.toString());
        prefs.setString('userType', result.data.userType.toString());
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('#######RESPONSE Case12');
      throw Exception(e.toString());
    }
  }

}