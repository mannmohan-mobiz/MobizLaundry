// To parse this JSON data, do
//
//     final pickerOutStandingModel = pickerOutStandingModelFromJson(jsonString);

import 'dart:convert';

PickerOutStandingModel pickerOutStandingModelFromJson(String str) => PickerOutStandingModel.fromJson(json.decode(str));

String pickerOutStandingModelToJson(PickerOutStandingModel data) => json.encode(data.toJson());

class PickerOutStandingModel {
  bool status;
  PickerOutStanding data;
  String message;

  PickerOutStandingModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerOutStandingModel.fromJson(Map<String, dynamic> json) => PickerOutStandingModel(
    status: json["status"],
    data: PickerOutStanding.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class PickerOutStanding {
  List<PendingAmout> pendingAmout;
  num overallDue;

  PickerOutStanding({
    required this.pendingAmout,
    required this.overallDue,
  });

  factory PickerOutStanding.fromJson(Map<String, dynamic> json) => PickerOutStanding(
    pendingAmout: List<PendingAmout>.from(json["pending_amout"].map((x) => PendingAmout.fromJson(x))),
    overallDue: json["overall_due"],
  );

  Map<String, dynamic> toJson() => {
    "pending_amout": List<dynamic>.from(pendingAmout.map((x) => x.toJson())),
    "overall_due": overallDue,
  };
}

class PendingAmout {
  String customerName;
  String customerId;
  num totalShortSum;
  int pendingInvoices;
  String mobileNumber;
  dynamic gpse;
  dynamic gpsn;

  PendingAmout({
    required this.customerName,
    required this.customerId,
    required this.totalShortSum,
    required this.pendingInvoices,
    required this.mobileNumber,
    required this.gpse,
    required this.gpsn,
  });

  factory PendingAmout.fromJson(Map<String, dynamic> json) => PendingAmout(
    customerName: json["customer_name"],
    customerId: json["customer_id"],
    totalShortSum: json["total_short_sum"],
    pendingInvoices: json["pending_invoices"],
    mobileNumber: json["mobile_number"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
  );

  Map<String, dynamic> toJson() => {
    "customer_name": customerName,
    "customer_id": customerId,
    "total_short_sum": totalShortSum,
    "pending_invoices": pendingInvoices,
    "mobile_number": mobileNumber,
    "GPSE": gpse,
    "GPSN": gpsn,
  };
}
