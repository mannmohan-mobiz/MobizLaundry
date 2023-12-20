// To parse this JSON data, do
//
//     final deliveryTimeList = deliveryTimeListFromJson(jsonString);

import 'dart:convert';

DeliveryTimeList deliveryTimeListFromJson(String str) => DeliveryTimeList.fromJson(json.decode(str));

String deliveryTimeListToJson(DeliveryTimeList data) => json.encode(data.toJson());

class DeliveryTimeList {
  bool status;
  List<String> data;
  String message;

  DeliveryTimeList({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryTimeList.fromJson(Map<String, dynamic> json) => DeliveryTimeList(
    status: json["status"],
    data: List<String>.from(json["data"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
}
