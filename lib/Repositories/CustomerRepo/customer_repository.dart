import 'package:dio/dio.dart';
import 'package:integrate_3screens/Utils/common.dart';

import '../../Models/CustomerModel/category_model.dart';
import '../../Models/CustomerModel/sub_category_model.dart';
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
    } catch (e) {
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
        baseUrl+'customer/new_order_branch_categories_api',
        data: data,
        options: options
      );
      if (response.statusCode == 200) {
        var result = CustomerCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get sub category
  Future<CustomersubCategoryModel> getSubCat({required String cat_id, required String token}) async {
    Map<String, String> data = {
      "category_id": cat_id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    try {
      var response = await dio.post(
        baseUrl+'customer/new_order_branch_sub_categories_api',
        data: data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = CustomersubCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}