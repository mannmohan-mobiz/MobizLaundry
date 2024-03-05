// To parse this JSON data, do
//
//     final complaintDetailSaveModel = complaintDetailSaveModelFromJson(jsonString);

import 'dart:convert';

ComplaintDetailSaveModel complaintDetailSaveModelFromJson(String str) => ComplaintDetailSaveModel.fromJson(json.decode(str));

String complaintDetailSaveModelToJson(ComplaintDetailSaveModel data) => json.encode(data.toJson());

class ComplaintDetailSaveModel {
  bool status;
  ComplaintDetail data;
  String message;

  ComplaintDetailSaveModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ComplaintDetailSaveModel.fromJson(Map<String, dynamic> json) => ComplaintDetailSaveModel(
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
  String remarkFromPicker;
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
