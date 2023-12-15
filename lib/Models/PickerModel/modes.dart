// To parse this JSON data, do
//
//     final modes = modesFromJson(jsonString);

import 'dart:convert';

import 'package:golden_falcon/Models/PickerModel/picker_delivery_date.dart';

Modes modesFromJson(String str) => Modes.fromJson(json.decode(str));

String modesToJson(Modes data) => json.encode(data.toJson());

class Modes {
  bool status;
  List<DeliveryModes> data;
  String message;

  Modes({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Modes.fromJson(Map<String, dynamic> json) => Modes(
    status: json["status"],
    data: List<DeliveryModes>.from(json["data"].map((x) => DeliveryModes.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryModes {
  String mode;
  String name;
  String extraValue;

  DeliveryModes({
    required this.mode,
    required this.name,
    required this.extraValue,
  });

  factory DeliveryModes.fromJson(Map<String, dynamic> json) => DeliveryModes(
    mode: json["mode"],
    name: json["name"],
    extraValue: json["extra_value"],
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "name": name,
    "extra_value": extraValue,
  };
}
