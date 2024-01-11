// To parse this JSON data, do
//
//     final deliveryAddressList = deliveryAddressListFromJson(jsonString);

import 'dart:convert';

DeliveryAddressList deliveryAddressListFromJson(String str) => DeliveryAddressList.fromJson(json.decode(str));

String deliveryAddressListToJson(DeliveryAddressList data) => json.encode(data.toJson());

class DeliveryAddressList {
  final bool? status;
  final List<Map<String, String?>>? data;
  final String? message;

  DeliveryAddressList({
    this.status,
    this.data,
    this.message,
  });

  factory DeliveryAddressList.fromJson(Map<String, dynamic> json) => DeliveryAddressList(
    status: json["status"],
    data: json["data"] == null ? [] : List<Map<String, String?>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "message": message,
  };
}
