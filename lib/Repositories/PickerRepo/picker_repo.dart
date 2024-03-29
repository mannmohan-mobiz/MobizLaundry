import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:golden_falcon/Picker_App/util/common_methods.dart';
import 'package:http/http.dart' as http;
import 'package:golden_falcon/Models/PickerModel/collection_list_model.dart';
import 'package:golden_falcon/Models/PickerModel/punch_in_out_model.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Utils/common.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../Models/PickerModel/add_customer_model.dart';
import '../../Models/PickerModel/add_new_complaint_detail_model.dart';
import '../../Models/PickerModel/add_new_complaint_model.dart';
import '../../Models/PickerModel/add_to_wallet_model.dart';
import '../../Models/PickerModel/area_list_model.dart';
import '../../Models/PickerModel/cart_delete.dart';
import '../../Models/PickerModel/cart_list_model.dart';
import '../../Models/PickerModel/cart_list_quantity_model.dart';
import '../../Models/PickerModel/collect_items_model.dart';
import '../../Models/PickerModel/complaint_detail_model.dart';
import '../../Models/PickerModel/complaint_detail_save_model.dart';
import '../../Models/PickerModel/complaint_model.dart';
import '../../Models/PickerModel/complaint_register_model.dart';
import '../../Models/PickerModel/confirm_order_model.dart';
import '../../Models/PickerModel/corporate_save_model.dart';
import '../../Models/PickerModel/customer_home_history_model.dart';
import '../../Models/PickerModel/customer_home_model.dart';
import '../../Models/PickerModel/customer_home_order_history_detail_model.dart';
import '../../Models/PickerModel/customer_list_model.dart';
import '../../Models/PickerModel/dashboard_count_model.dart';
import '../../Models/PickerModel/deliver_to_customer_model.dart';
import '../../Models/PickerModel/delivered_order_model.dart';
import '../../Models/PickerModel/delivery_address_list.dart';
import '../../Models/PickerModel/delivery_door_lock_model.dart';
import '../../Models/PickerModel/delivery_list_model.dart';
import '../../Models/PickerModel/delivery_time.dart';
import '../../Models/PickerModel/deposit_history_model.dart';
import '../../Models/PickerModel/deposit_model.dart';
import '../../Models/PickerModel/emirates_list_model.dart';
import '../../Models/PickerModel/expense_add_model.dart';
import '../../Models/PickerModel/expense_drop_down_model.dart';
import '../../Models/PickerModel/expense_list_model.dart';
import '../../Models/PickerModel/location_list_model.dart';
import '../../Models/PickerModel/location_price_model.dart';
import '../../Models/PickerModel/mark_as_picked_model.dart';
import '../../Models/PickerModel/modes.dart';
import '../../Models/PickerModel/new_order_save.dart';
import '../../Models/PickerModel/order_details_model.dart';
import '../../Models/PickerModel/order_history_model.dart';
import '../../Models/PickerModel/order_report_detail_model.dart';
import '../../Models/PickerModel/order_report_model.dart';
import '../../Models/PickerModel/outstanding_model.dart';
import '../../Models/PickerModel/personal_save_model.dart';
import '../../Models/PickerModel/picker_add_to_cart_model.dart';
import '../../Models/PickerModel/picker_cart_count_model.dart';
import '../../Models/PickerModel/picker_category_model.dart';
import '../../Models/PickerModel/picker_collections_model.dart';
import '../../Models/PickerModel/picker_confirmed_list_model.dart';
import '../../Models/PickerModel/picker_delivery_date.dart';
import '../../Models/PickerModel/picker_item_price_model.dart';
import '../../Models/PickerModel/picker_order_confirm.dart';
import '../../Models/PickerModel/picker_outstanding_model.dart';
import '../../Models/PickerModel/picker_payment_list.dart';
import '../../Models/PickerModel/picker_pickup_list_model.dart';
import '../../Models/PickerModel/picker_sub_category_model.dart';
import '../../Models/PickerModel/picker_wallet_balance_model.dart';
import '../../Models/PickerModel/punch_in_model.dart';
import '../../Models/PickerModel/punch_out_model.dart';
import '../../Models/PickerModel/quantity_price.dart';
import '../../Models/PickerModel/ready_for_despatch.dart';
import '../../Models/PickerModel/ready_transit_model.dart';
import '../../Models/PickerModel/recharge_wallet_model.dart';
import '../../Models/PickerModel/recharge_wallet_receipt_model.dart';
import '../../Models/PickerModel/search.dart';
import '../../Models/PickerModel/search_clients_model.dart';
import '../../Models/PickerModel/select_payment_model.dart';
import '../../Models/PickerModel/statement_account_model.dart';
import '../../Models/PickerModel/thankyou_model.dart';
import '../../Models/PickerModel/top_up_request_manage_model.dart';
import '../../Models/PickerModel/top_up_request_model.dart';
import '../../Models/PickerModel/undelivered_model.dart';
import '../../Models/PickerModel/undelivered_status_model.dart';

class PickerRepository {

  // Dashboard counts
  Future<DashboardCountModel> getDashboardData({required String token, required String id}) async {
    print("Entr");
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    print(headers);
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
    Dio dio = Dio();
    // Map<String, String> headers = {
    //   'Authorization': 'Basic $token',
    // };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token',
      }
    );
    Map<String, String> data = {
      'id': userId,
      'total_amount': amount,
    };

    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/deposit_add_api',
        data: data,
        options: options
      );
      var result = jsonEncode(response.data);
      print(result);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var final_data = DepositModel.fromRawJson(result);
        return final_data;
      } else {
        print('repo else');
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
  // Get Expense Head
  Future<ExpenseDropDownModel> getExpenseHead({required String token}) async {
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.get(Uri.parse(baseUrl+'picker/expense_add_api'), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseDropDownModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add Expense
  Future<ExpenseAddModel> addExpense(Map<String, String> body, String token) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token',
        }
    );
    Map<String, String> data = body;
    print(data);
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/expense_add_api',
        options: options,
        data: data
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseAddModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  // List Expense
  Future<ExpenseListModel> getExpenses({required String id, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Map<String, String> data = {
      'id': id
    };
    
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/expense_list_api',
        data: data,
        options: options
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Outstanding Dues
  Future<PickerOutstandingDueModel> getOutstandings({required String id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id" : id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/outstanding_dues_api',
        data: data,
        options: options
      );

      if ( response.statusCode == 200 || response.statusCode == 201 ) {
        var result = PickerOutstandingDueModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  // Deposit History
  Future<PickerDepositHistoryModel> getHistory({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/deposit_history_api',
        data: body,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerDepositHistoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order History
  Future<PickerOrderHistoryModel> getOrderList({required String token, required Map<String, String> data}) async {
    print(data);
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/order_history_list_api',
        options: options,
        data: data
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderHistoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order Details
  Future<PickerOrderDetailsModel> getOrderDetails({required String orderNo, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Map<String, String> data = {
      "order_number": orderNo
    };
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/customer_order_details_api',
        data: data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Collection List
  Future<PickerCollectionListModel> getCollectionList({required token, required Map<String, String> data}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/collection_details_api',
        data: data,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCollectionListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pickup List
  Future<PickerPickupListModel> getPickUps({required String token, required String id}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id":id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
       baseUrl+'picker/pickup_list_api',
        data: data,
        options: options
      );
      print('######PICKUP LIST$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerPickupListModel.fromJson(response.data);
        print('######PICKUP LIST RESULT$result');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order Confirm
  Future<PickerOrderConfirmModel> confirmOrder({required Map<String, String> body, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_confirm_new_order_api',
        data: body,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderConfirmModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pickup Confirmed List
  Future<PickerConfirmedListModel> getPickUpConfirmedList({required String token, required String id}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id":id
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_confirmed_order_api',
          data: data,
          options: options
      );
      print('#########ghghg##${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerConfirmedListModel.fromJson(response.data);
        print('#########ghghg###${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('fctctr##'+e.toString());
    }
  }


  // Ready For Despatch List
  Future<ReadyForDespatch> getReadyForDespatch({required String token, required String id}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id":id
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_ready_for_dispatch_Api',
          data: data,
          options: options
      );
      print('######Ready for despatch LIST$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ReadyForDespatch.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // Ready For Despatch Intransit
  Future<PickerReadyTransitModel> getReadyForDespatchTransit({required String token, required String orderid}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id":orderid
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/order_statuschange_api',
          data: data,
          options: options
      );
      print('######Ready for despatch status$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerReadyTransitModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Undelivered List
  Future<PickerUndeliveredModel> getUndeliveredApi({required String token, required String id}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id":id
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_undelivered_order_api',
          data: data,
          options: options
      );
      print('######Undelivered LIST$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerUndeliveredModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Undelivered status
  Future<PickerUndeliveredStatusModel> getUndeliveredStatusApi({required String token, required String orderId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id":orderId
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/order_status_deliverd_api',
          data: data,
          options: options
      );
      print('######Undelivered Status###$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerUndeliveredStatusModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // Customer Search

  Future<Search> getSearchCustomerList({required String token, required String key}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "key":key
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/search_customer',
          data: data,
          options: options
      );
      print('#########ssssdd##${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = Search.fromJson(response.data);
        print('#########ssssdd##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('fctctr##'+e.toString());
    }
  }

  // Delivery Date List

  Future<DeliveryDateList> getDeliveryDateList({required String token, required String mode}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "delivery_mode": mode
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/delivery_date',
          data: data,
          options: options
      );
      print('#########ssssdd11##${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryDateList.fromJson(response.data);
        print('#########ssssdd111122##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('fctctr##'+e.toString());
    }
  }
  // Delivery Time List

  Future<DeliveryTimeList> getDeliveryTimeList({required String token, required String deliveryDate}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "date": deliveryDate
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/delivery_time_api',
          data: data,
          options: options
      );
      print('#########eeeee22##${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryTimeList.fromJson(response.data);
        print('#########eeeee23333##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('grttt##'+e.toString());
    }
  }


  // Punch In / Out
  Future<PickerPunchInOutModel> punchIn({required String token, required String id, required String task}) async {
    Dio dio = Dio();
    String url = '';
    if (task == "punch_in") {
      url = 'picker/picker_punch_in_api';
    } else if (task == "punch_out"){
      url = 'picker/picker_punch_out_api';
    }
    print(url);
    Future.delayed(Duration(seconds: 1));
    Map<String, String> data = {
      "userid": id
    };

    Map<String, String> out_data = {
      "id": id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+url,
        data: task == "punch_in" ? data : out_data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerPunchInOutModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Picker Outstanding
  Future<PickerOutStandingModel> getPickerOutstandingApi({required String token}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/outstanding',
          options: options
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOutStandingModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Location Price Group GET
  Future<LocationPriceGroupModel> getLPGData({required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get(
        baseUrl+'picker/picker_add_customer_api',
        options: options
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = LocationPriceGroupModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery Modes GET
  Future<Modes> getDeliveryModesData({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          baseUrl+'picker/delivery_mode',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = Modes.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Punch in get
  Future<PunchInModel> getPunchInApi({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          baseUrl+'picker/punchin',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PunchInModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Punch Out post
  Future<PunchOutModel> getPunchOutApi({required String token, required String attendanceId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "attendence_id": attendanceId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/punchin',
          data: data,
          options: options
      );

      print('punch out: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PunchOutModel.fromJson(response.data);
        print('Deliver to customers RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery  GET
  Future<DeliveryListModel> getDeliveryListApi({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          baseUrl+'picker/picker_ready_for_delivery_order',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryListModel.fromJson(response.data);
        print('RR@@@@$result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Delivery door lock
  Future<DeliveryDoorLockModel> deliveryDoorLockApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/door_locked_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryDoorLockModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Top up request manage
  Future<TopUpRequestManageModel> topUpRequestManageApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/top_up_request_manage_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = TopUpRequestManageModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Picker complaint submit
  Future<ComplaintDetailSaveModel> complaintDetailSaveApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/complaint_details_submit_picker_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ComplaintDetailSaveModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Deliver to customers
  Future<DeliveryToCustomerModel> deliverToCustomerApi({required String token, required String orderId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id": orderId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/deliver_to_customer_page',
          data: data,
          options: options
      );

      print('Deliver to customers: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryToCustomerModel.fromJson(response.data);
        print('Deliver to customers RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Save New Order
  Future<SelectPaymentModel> deliverToCustomerPaymentApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/select_mode_payment_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = SelectPaymentModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Delivered orders
  Future<DeliveredOrderModel> getDeliveredOrdersApi({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          baseUrl+'picker/deliverd_orders_api',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveredOrderModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Top up request
  Future<TopUpRequestModel> getTopUpRequestApi({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          baseUrl+'picker/top_up_request_api',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = TopUpRequestModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Delivery Address GET
  Future<DeliveryAddressList> getDeliveryAddressListData({
    required String token,required String customerId}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          '${baseUrl}picker/get_multiple_addrs_api/$customerId',
          options: options
      );
      print('RRRRRRR$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('code#${response.statusCode}');
        var result = DeliveryAddressList.fromJson(response.data);
        print('RES#$result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery Payment GET
  Future<PickerPaymentList> getPaymentListApi({required String token}) async {

    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      print('RRRRRRR332222');
      var response = await dio.get(
          '${baseUrl}picker/list_of_payment_picker_api',
          options: options
      );
      print('RRRRRRR33$response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerPaymentList.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get emirates
  Future<EmiratesListModel> getEmiratesData() async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.get(Uri.parse
        (baseUrl+'accounts/add_personal_emirates'),
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = EmiratesListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get area
  Future<AreaListModel> getAreaData({required String emirateID}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/add_personal_area'),
          //headers: headers,
          body: {
            "emirate_id": emirateID
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = AreaListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get location
  Future<LocationListModel> getLocationData({required String areaID}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/add_personal_location'),
          //headers: headers,
          body: {
            "area_id": areaID
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = LocationListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get personal save
  Future<PersonalSaveModel> getPersonalData({
    required String userName,
    required String name,
    required String emailID,
    required String password,
    required String customerType,
    required int buildingNo,
    required String roomNo,
    required int mobile,
    required int altMobile,
    required int whatsApp,
    required int creditLimit,
    required int creditDays,
    required int creditInvoices,
    required int gpse,
    required int gpsn,
    required String location,
    required String trn,
    required String billingAddress,
    required String designation,
    required String buildingName,
    required String floorNumber,
    required String flatNumber
  }) async {
    Dio dio = Dio();
    Future.delayed(Duration(seconds: 1));
    try {
      var body= {
        "username": userName,
        "name": name,
        "email": emailID,
        "password": password,
        "customer_type": customerType,
        "building_no": buildingNo.toString(),
        "room_no": roomNo,
        "mobile": mobile.toString(),
        "alt_mobile": altMobile.toString(),
        "whats_app": whatsApp.toString(),
        "credit_limit": creditLimit.toString(),
        "credit_days": creditDays.toString(),
        "credit_invoices": creditInvoices.toString(),
        "GPSE": gpse.toString(),
        "GPSN": gpsn.toString(),
        "Location": location,
        "TRN": trn,
        "billing_addrs": billingAddress,
        "designation": designation,
        "building_name": buildingName,
        "floor_number": floorNumber,
        "flat_number": flatNumber
      };
      // var aa=json.encode(body);
      // print("BBBOOODDDYYYBBBOOODDDYYY ${aa}")  ;
      debugPrint('Personal Body $body');
      var response =  await dio.post('${baseUrl}accounts/personal_datasave',data: body);
      print('///////lllllll  ${response.data}');
      print('///////lllllll  ${response.statusCode}');
      if (response.statusCode == 200 ) {
        var result = PersonalSaveModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print("EEERROORR ${e.toString()}");
      throw Exception(e.toString());
    }
  }


  //get corporate save
  Future<CorporateSaveModel> getCorporateData({
    required String userName,
    required String name,
    required String emailID,
    required String password,
    required String customerType,
    required String buildingNo,
    required String roomNo,
    required String regEmail,
    required int mobile,
    required int altMobile,
    required int whatsApp,
    required int creditLimit,
    required int creditDays,
    required int creditInvoices,
    required int gpse,
    required int gpsn,
    required String location,
    required String companyName,
    required String trn,
    required String billingAddress,
    required String designation,
    required String buildingAddress,
    required String floorNumber,
    required String flatNumber,
    required List<AddressList>? addressList
  }) async {
    Dio dio = Dio();
    Future.delayed(Duration(seconds: 1));
    try {
      print('boddyyy ${addressList?.length}');
      var body = {
        "username": userName,
        "name": name,
        "email": emailID,
        "password": password,
        "customer_type": customerType,
        "building_no": buildingNo,
        "room_no": roomNo,
        "reg_email": regEmail,
        "mobile": mobile,
        "alt_mobile": altMobile,
        "whats_app": whatsApp,
        "credit_limit": creditLimit,
        "credit_days": creditDays,
        "credit_invoices": creditInvoices,
        "GPSE": gpse,
        "GPSN": gpsn,
        "Location": location,
        "company_name": companyName,
        "TRN": trn,
        "billing_addrs": billingAddress,
        "designation": designation,
        "building_name": buildingAddress,
        "floor_number": floorNumber,
        "flat_number": flatNumber,
        "address_list": addressList
      };
      print('boddyyy ${jsonEncode(body)}');
      var response =  await dio.post('${baseUrl}accounts/corporate_datasave',data: body);
      print('///////ccccccccc  ${response.data}');
      print('///////cccccccccc  ${response.statusCode}');
      if (response.statusCode == 200 ) {
        print('vbvbvbvbvb ${response.data}');
        var result = CorporateSaveModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print("EEERROORR ${e.toString()}");
      throw Exception(e.toString());
    }
  }


  // Add Customer
  Future<AddCustomerModel> addNewClient({required Map<String, String> body, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = body;
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_customer_api',
        data: data,
        options: options
      );
      print("=============[CLIENT]===============");
      print(response.data);
      print("============================");
      if (response.statusCode ==200 || response.statusCode == 201) {
        var result = AddCustomerModel.fromJson(response.data);
        authData.setResponse(jsonDecode(response.data)['message']);
        return result;
      } else {
        authData.setResponse(jsonDecode(response.data)['message']);
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // List Customer
  Future<PickerCustomerListModel> listMyClients({required String token, required String id}) async {
    Dio dio = Dio();
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
        baseUrl+'picker/customer_list_api',
        data: data,
        options: options
      );
    print("**************************");
    print(response.data);
    print("**************************");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCustomerListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Customer wallet_recharge
  Future<WalletRechargeModel> rechargeWalletApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/pick_cust_wallet_recharge_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = WalletRechargeModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Save New Order
  Future<PickerNewOrderSaveModel> saveNewOrder({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_new_order_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerNewOrderSaveModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  //Order Confirm || Place order
  Future<PickerConfirmOrderModel> orderConfirmApi({required String token, required Map<String, dynamic> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('### token ### $token');
    debugPrint('### body ### $body');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_payment_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerConfirmOrderModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  //Mark as picked
  Future<MarkAsPickedModel> markAsPickedApi({required String token, required Map<String, dynamic> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('### token ### $token');
    debugPrint('### body ### $body');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/mark_as_picked_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = MarkAsPickedModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Get Categories
  Future<PickerCategoryModel> getPickerCategs({required String id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id" : id
    };
    Options options = Options(
      headers: {
        'Authorization' : 'Basic ${token}'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_branch_categories_api',
        data: data,
        options: options
      );

      print("*******************[RESP]*************************");
      print("RESP##${response.data}");
      print("*******************[RESP]*************************");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Get Sub Categ
  Future<PickerSubCategoryModel> getPickerSubCategs({required String categ_id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "category_id" : categ_id
    };

    Options options = Options(
      headers: {
        'Authorization' : 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_branch_sub_categories_api',
        options: options,
        data: data
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerSubCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Get Item
  Future<PickerItemsPriceModel> getItemsPrice({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    print(body);
    Options options = Options(
      headers: {
        'Authorization' : 'Basic $token'
      }
    );

    Future.delayed(const Duration(seconds: 1));

    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_item_details_api',
        data: body,
        options: options
      );
      print('######RESPONSE${response}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerItemsPriceModel.fromJson(response.data);
        print('######RESULT#${result}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  //Get wallet balance cart page
  Future<PickerWalletBalanceModel> getWalletBalanceApi({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    print(body);
    Options options = Options(
        headers: {
          'Authorization' : 'Basic $token'
        }
    );

    Future.delayed(const Duration(seconds: 1));

    try {
      var response = await dio.post(
          baseUrl+'picker/get_wallet_balance_picker',
          data: body,
          options: options
      );
      print('######RESPONSE${response}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerWalletBalanceModel.fromJson(response.data);
        print('######RESULT#${result}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  //Get QUANTITY price
  Future<QunatityPriceModel> getQuantityPrice({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    print(body);
    Options options = Options(
        headers: {
          'Authorization' : 'Basic $token'
        }
    );

    Future.delayed(const Duration(seconds: 1));

    try {
      var response = await dio.post(
          baseUrl+'picker/picker_addmore_quantity_api',
          data: body,
          options: options
      );
      print('######RESPONSE${response}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = QunatityPriceModel.fromJson(response.data);
        print('######RESULT#${result}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  // Add to Cart
  Future<PickerAddToCartModel> addToCart({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
      headers:  {
        'Authorization' : 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_cart_api',
        data: body,
        options: options
      );

      print('ADD to CRT : $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerAddToCartModel.fromJson(response.data);
        print('ADD to CRT RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEEEE'+ e.toString());
    }
  }


  // Add to Cart Count
  Future<PickerCartCountModel> addToCartCount({required String token, required String orderId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id": orderId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_cart_count_api',
          data: data,
          options: options
      );

      print('ADD to CRT COUNT: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCartCountModel.fromJson(response.data);
        print('ADD to CRT COUNT RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add to Cart List
  Future<PickerCartListModel> addToCartListData({required String token, required String orderId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id": orderId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_cart_list_api',
          data: data,
          options: options
      );

      print('ADD to CRT list: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCartListModel.fromJson(response.data);
        print('ADD to CRT list RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Collected Items list
  Future<CollectItemsList> collectItemsListApi({required String token, required String orderId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id": orderId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_collect_item_api',
          data: data,
          options: options
      );

      print('COLLECT ITEMS list: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = CollectItemsList.fromJson(response.data);
        print('COLLECT ITEMS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Collected Items list
  Future<DeliveryDateList> deliveryDateCollectionApi({required String token, required String orderType}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_type": orderType
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/delivery_date_collection',
          data: data,
          options: options
      );

      print('DELIVERY DATE list: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveryDateList.fromJson(response.data);
        print('DELIVERY DATE LIST RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Thank you
  Future<PickerThankyouModel> thankYouListData({required String token, required String orderId, required String customerId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id": orderId,
      "customer_id": customerId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_thankyou_api',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerThankyouModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Complaint
  Future<ComplaintModel> complaintListApi({required String token, required String customerId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "customer_id": customerId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/picker_complaint_api',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ComplaintModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add new Complaint
  Future<AddNewComplaintModel> addNewComplaintListApi({required String token, required String customerId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "customer_id": customerId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/add_new_complaint',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = AddNewComplaintModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add new Complaint register
  Future<ComplaintRegisterModel> complaintRegisterApi({required String token, required Map<String, dynamic> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('### token ### $token');
    debugPrint('### body ### $body');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/register_now_picker',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ComplaintRegisterModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Customer Home
  Future<CustomerHomeOrderModel> customerHomeApi({required String token,required String customerId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "customer_id": customerId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/customer_home_api',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = CustomerHomeOrderModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }

    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }


  //Add to wallet
  Future<AddtoWalletModel> addToWalletApi({required String token, required String customerId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "customer_id": customerId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/customer_wallet_picker',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = AddtoWalletModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  //wallet recharge receipt
  Future<WalletRechargeReceiptModel> walletRechargeReceipt({required String token, required String transferId}) async {
    Dio dio = Dio();
    debugPrint('####transferId#### $transferId');
    Map<String, String> data = {
      "transfer_id": transferId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/wallet_recharge_receipt',
          data: data,
          options: options
      );

      print('RESPONSE DETAILS: $response.data');
      debugPrint('response.statusCode ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('response.statusCode ${response.data}');
        var result = WalletRechargeReceiptModel.fromJson(response.data);
        print('RESPONSE DETAILS RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }
  //Get Cart list  QUANTITY price
  Future<PickerCartQuantityListModel> getCartQuantityPrice({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    print(body);
    Options options = Options(
        headers: {
          'Authorization' : 'Basic $token'
        }
    );

    Future.delayed(const Duration(seconds: 1));

    try {
      var response = await dio.post(
          baseUrl+'picker/picker_cartin_addmore_quantity_Api',
          data: body,
          options: options
      );
      print('######RESPONSE${response}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCartQuantityListModel.fromJson(response.data);
        print('######RESULT#${result}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  //Download PDF
  Future<void> downloadPdf({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/generate_pdf',
          data: body,   options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),);

      if(response.statusCode == 200) {
        var tempDir = await getTemporaryDirectory();
        debugPrint('tempDir $tempDir');
        final file = File('${tempDir.path}/receipt.pdf');
        var raf = file.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
        OpenFile.open(file.path);
      }
    } catch (e) {
      throw Exception('EEE'+e.toString());
    }
  }

  //Share PDF
  Future<void> sharePdf() async {
    var tempDir = await getTemporaryDirectory();
    final result = await Share.shareXFiles([XFile('${tempDir.path}/receipt.pdf')], text: 'Receipt');
    if (result.status == ShareResultStatus.success) {
      debugPrint('Thank you for sharing the picture!');
    }
  }


    // Cart Delete
  Future<PickerCartDeleteModel> deleteCartData({required String token, required String cartId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "cart_id": cartId
    };
    Future.delayed(const Duration(seconds: 1));
    Options options = Options(
        headers:  {
          'Authorization' : 'Basic $token'
        }
    );
    try {
      var response = await dio.post(
          baseUrl+'picker/cart_deletion_api',
          data: data,
          options: options
      );

      print('cart delete: $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCartDeleteModel.fromJson(response.data);
        print('cart delete RST : $result');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Customer Home History
  Future<CustomerHomeHistoryModel> getCustomerHistoryResults({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/order_history_status_picker_api',
        data: body,
        options: options,
      );
      print('RESPONSE####${response.data}####');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = CustomerHomeHistoryModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Customer home order history detail
  Future<CustomerHomeOrderHistoryDetailModel> getCustomerHistoryDetail({required String token, required String orderid}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id":orderid
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/order_details_picker_api',
          data: data,
          options: options
      );
      print('###### status$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = CustomerHomeOrderHistoryDetailModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Complaint order detail
  Future<AddNewComplaintDetailModel> getComplaintDetailApi({required String token, required String orderid}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id":orderid
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/complaint_order_details_api',
          data: data,
          options: options
      );
      print('###### status$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = AddNewComplaintDetailModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Complaint  detail
  Future<ComplaintDetailModel> complaintDetailApi({required String token, required String complainId}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "complaint_id":complainId
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/complaint_details_picker_api',
          data: data,
          options: options
      );
      print('###### status$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ComplaintDetailModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }


  // Delivered order list
  Future<DeliveredOrderModel> getDeliveredOrder({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/deliverd_orders_datefilter_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DeliveredOrderModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  //order Report detail
  Future<OrderReportDetailModel> getOrderReportDetail({required String token, required String orderid}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "order_id":orderid
    };
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl+'picker/order_report_detail_api',
          data: data,
          options: options
      );
      print('###### status$response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = OrderReportDetailModel.fromJson(response.data);
        print('#########responsee##${result.toString()}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }



  // Order Report
  Future<OrderReportModel> getOrderReport({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('WW11####$body####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/order_report_picker_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = OrderReportModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }


  // Collections
  Future<PickerCollectionsModel> getCollectionsApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('WW11####$body####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_collection_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCollectionsModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Statement Account List
  Future<StatementAccountModel> getStatementAccountApi({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    print('WW####$options####');
    debugPrint('WW11####$body####');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/statement_account_api',
        data: body,
        options: options,
      );


      print('RESPONSE####${response.data}####');


      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = StatementAccountModel.fromJson(response.data);
        print('RESULT####$result####');
        return result;

      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('EEEE#$e');
    }
  }

  // Search
  Future<Search> getSearchResults({required String searchKey, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Map<String, String> data = {
      "key": searchKey
    };
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl + 'picker/search_customer',
          data: data,
          options: options
      );
      print('RES#${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = Search.fromJson(response.data);
        print('RES211#${response.data}');
        return result;
      } else {
         return response.data;
      }
    } catch (e) {
      throw Exception('oooo' + e.toString());
    }
  }


  // Search Clients
  Future<PickerCustomerListModel> getSearchClients({required String searchMobile, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Map<String, String> data = {
      "mobile": searchMobile
    };
    print('RES211#$data');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl + 'picker/customer_list_search',
          data: data,
          options: options
      );
      print('RES#${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCustomerListModel.fromJson(response.data);
        print('RES211#${response.data}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('oooo@@' + e.toString());
    }
  }

  // Search Order
  Future<OrderReportModel> getSearchOrder({required String searchKey, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        }
    );
    Map<String, String> data = {
      "key": searchKey
    };
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
          baseUrl + 'picker/order_report_search_api',
          data: data,
          options: options
      );
      print('ORDRES#${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = OrderReportModel.fromJson(response.data);
        print('ORDRES211#${response.data}');
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception('oooo' + e.toString());
    }
  }
}

