import 'package:dio/dio.dart';
import 'package:integrate_3screens/Utils/common.dart';

import '../../Models/CustomerModel/wallet_outstanding_model.dart';

class CustomerRepository {
  Dio dio = Dio();
//   Wallet Balance and OutStanding;
  Future<CustomerBalanceModel> getBalanceData({required String token, required String id}) async {
    Map<String, String> data = {
      'id': id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'customer/wallet_balance_api',
        data: data,
        options: options
      );

      print(response.data);

      if (response.statusCode == 200 ) {
        var result = CustomerBalanceModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {nc
      throw Exception(e.toString());
    }
  }

  // get Category
  Future<CustomerCategoryModel> getCategories({required String id, required String token}) async {
    Map<String, String> data = {
      'id': id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));

    try {
      var response = await dio.post(
        baseUrl+''
      );
    }
  }
}