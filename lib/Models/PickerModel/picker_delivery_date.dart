// To parse this JSON data, do
//
//     final deliveryDateList = deliveryDateListFromJson(jsonString);

import 'dart:convert';

DeliveryDateList deliveryDateListFromJson(String str) => DeliveryDateList.fromJson(json.decode(str));

String deliveryDateListToJson(DeliveryDateList data) => json.encode(data.toJson());

class DeliveryDateList {
  bool status;
  List<Date> data;
  String message;

  DeliveryDateList({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryDateList.fromJson(Map<String, dynamic> json) => DeliveryDateList(
    status: json["status"],
    data: List<Date>.from(json["data"].map((x) => Date.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Date {
  DateTime date;
  String day;

  Date({
    required this.date,
    required this.day,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    date: DateTime.parse(json["date"]),
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "day": day,
  };
}
