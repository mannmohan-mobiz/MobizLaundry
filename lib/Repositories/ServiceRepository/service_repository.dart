import 'package:dio/dio.dart';
import 'package:integrate_3screens/Models/ServiceModel/complaint_list_model.dart';
import 'package:integrate_3screens/Utils/common.dart';

class ServiceRepository {
  Dio dio = Dio();
  //Complaint List
  Future<ServiceComplaintListModel> getComplaintList({required String id, required String token}) async {
    Future.delayed(Duration(seconds: 1));
    Map<String, String> data = {
      "id": id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+'service/complaint_list_api',
        data: data,
        options: options
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceComplaintListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}