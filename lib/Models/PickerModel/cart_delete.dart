// To parse this JSON data, do
//
//     final pickerCartDeleteModel = pickerCartDeleteModelFromJson(jsonString);

import 'dart:convert';

PickerCartDeleteModel pickerCartDeleteModelFromJson(String str) => PickerCartDeleteModel.fromJson(json.decode(str));

String pickerCartDeleteModelToJson(PickerCartDeleteModel data) => json.encode(data.toJson());

class PickerCartDeleteModel {
  bool status;
  String message;

  PickerCartDeleteModel({
    required this.status,
    required this.message,
  });

  factory PickerCartDeleteModel.fromJson(Map<String, dynamic> json) => PickerCartDeleteModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
