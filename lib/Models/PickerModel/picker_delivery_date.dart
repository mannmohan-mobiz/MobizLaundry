// To parse this JSON data, do
//
//     final deliveryModes = deliveryModesFromJson(jsonString);

import 'dart:convert';

DeliveryModes deliveryModesFromJson(String str) => DeliveryModes.fromJson(json.decode(str));

String deliveryModesToJson(DeliveryModes data) => json.encode(data.toJson());

class DeliveryModes {
  bool status;
  List<DateTime> data;
  String message;

  DeliveryModes({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryModes.fromJson(Map<String, dynamic> json) => DeliveryModes(
    status: json["status"],
    data: List<DateTime>.from(json["data"].map((x) => DateTime.parse(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    "message": message,
  };
}
