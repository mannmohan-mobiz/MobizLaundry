// To parse this JSON data, do
//
//     final topUpRequestManageModel = topUpRequestManageModelFromJson(jsonString);

import 'dart:convert';

TopUpRequestManageModel topUpRequestManageModelFromJson(String str) => TopUpRequestManageModel.fromJson(json.decode(str));

String topUpRequestManageModelToJson(TopUpRequestManageModel data) => json.encode(data.toJson());

class TopUpRequestManageModel {
  bool status;
  List<TopUpRequestManage> data;
  String message;

  TopUpRequestManageModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory TopUpRequestManageModel.fromJson(Map<String, dynamic> json) => TopUpRequestManageModel(
    status: json["status"],
    data: List<TopUpRequestManage>.from(json["data"].map((x) => TopUpRequestManage.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class TopUpRequestManage {
  String mobile;
  dynamic gpse;
  dynamic gpsn;

  TopUpRequestManage({
    required this.mobile,
    required this.gpse,
    required this.gpsn,
  });

  factory TopUpRequestManage.fromJson(Map<String, dynamic> json) => TopUpRequestManage(
    mobile: json["mobile"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "GPSE": gpse,
    "GPSN": gpsn,
  };
}
