// To parse this JSON data, do
//
//     final topUpRequestModel = topUpRequestModelFromJson(jsonString);

import 'dart:convert';

TopUpRequestModel topUpRequestModelFromJson(String str) => TopUpRequestModel.fromJson(json.decode(str));

String topUpRequestModelToJson(TopUpRequestModel data) => json.encode(data.toJson());

class TopUpRequestModel {
  bool status;
  List<TopUpRequest> data;
  String message;

  TopUpRequestModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory TopUpRequestModel.fromJson(Map<String, dynamic> json) => TopUpRequestModel(
    status: json["status"],
    data: List<TopUpRequest>.from(json["data"].map((x) => TopUpRequest.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class TopUpRequest {
  String customerName;
  String customerId;
  String amount;
  DateTime date;

  TopUpRequest({
    required this.customerName,
    required this.customerId,
    required this.amount,
    required this.date,
  });

  factory TopUpRequest.fromJson(Map<String, dynamic> json) => TopUpRequest(
    customerName: json["customer_name"],
    customerId: json["customer_id"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_name": customerName,
    "customer_id": customerId,
    "amount": amount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}
