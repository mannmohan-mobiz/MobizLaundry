import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:integrate_3screens/Utils/common.dart';

import '../../Models/PickerModel/dashboard_count_model.dart';
import '../../Models/PickerModel/deposit_model.dart';

class PickerRepository {
  // Dashboard counts
  Future<DashboardCountModel> getDashboardData({required String token, required String id}) async {
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(
          Uri.parse(baseUrl+'picker/picker_dashboard_api'),
        headers: headers,
        body: {
            "id": id
        }
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DashboardCountModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
  // Deposit Adding
  Future<DepositModel> addDeposit({required String token, required String userId, required String amount}) async {
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    print(headers);
    print(amount);
    print(userId);
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(
          Uri.parse(baseUrl+'picker/deposit_add_api'),
        headers: headers,
        body: {
            "id": userId,
            "total_amount": amount
        },
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DepositModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}