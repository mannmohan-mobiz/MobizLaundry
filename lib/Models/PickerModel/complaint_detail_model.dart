// To parse this JSON data, do
//
//     final complaintDetailModel = complaintDetailModelFromJson(jsonString);

import 'dart:convert';

ComplaintDetailModel complaintDetailModelFromJson(String str) => ComplaintDetailModel.fromJson(json.decode(str));

String complaintDetailModelToJson(ComplaintDetailModel data) => json.encode(data.toJson());

class ComplaintDetailModel {
  bool status;
  ComplaintDetail data;
  String message;

  ComplaintDetailModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ComplaintDetailModel.fromJson(Map<String, dynamic> json) => ComplaintDetailModel(
    status: json["status"],
    data: ComplaintDetail.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class ComplaintDetail {
  String complaintId;
  DateTime createdDate;
  String complaintType;
  String service;
  String order;
  String remarks;
  dynamic remarkFromPicker;
  String status;
  dynamic replyFromCom;
  String complaintNumber;
  bool pickerStatus;

  ComplaintDetail({
    required this.complaintId,
    required this.createdDate,
    required this.complaintType,
    required this.service,
    required this.order,
    required this.remarks,
    required this.remarkFromPicker,
    required this.status,
    required this.replyFromCom,
    required this.complaintNumber,
    required this.pickerStatus,
  });

  factory ComplaintDetail.fromJson(Map<String, dynamic> json) => ComplaintDetail(
    complaintId: json["complaint_id"],
    createdDate: DateTime.parse(json["created_date"]),
    complaintType: json["complaint_type"],
    service: json["service"],
    order: json["order"],
    remarks: json["remarks"],
    remarkFromPicker: json["remark_from_picker"],
    status: json["status"],
    replyFromCom: json["reply_from_com"],
    complaintNumber: json["complaint_number"],
    pickerStatus: json["picker_status"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    "complaint_type": complaintType,
    "service": service,
    "order": order,
    "remarks": remarks,
    "remark_from_picker": remarkFromPicker,
    "status": status,
    "reply_from_com": replyFromCom,
    "complaint_number": complaintNumber,
    "picker_status": pickerStatus,
  };
}
