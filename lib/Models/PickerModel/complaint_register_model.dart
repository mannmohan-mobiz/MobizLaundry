// To parse this JSON data, do
//
//     final complaintRegisterModel = complaintRegisterModelFromJson(jsonString);

import 'dart:convert';

ComplaintRegisterModel complaintRegisterModelFromJson(String str) => ComplaintRegisterModel.fromJson(json.decode(str));

String complaintRegisterModelToJson(ComplaintRegisterModel data) => json.encode(data.toJson());

class ComplaintRegisterModel {
  bool status;
  ComplaintRegister data;
  String message;

  ComplaintRegisterModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ComplaintRegisterModel.fromJson(Map<String, dynamic> json) => ComplaintRegisterModel(
    status: json["status"],
    data: ComplaintRegister.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class ComplaintRegister {
  String complaintId;
  dynamic createdBy;
  DateTime createdDate;
  dynamic photo;
  dynamic uploadPhoto;
  String remarks;
  String status;
  dynamic reply;
  String complaintNumber;
  String complaintType;
  String service;
  String order;
  String customer;

  ComplaintRegister({
    required this.complaintId,
    required this.createdBy,
    required this.createdDate,
    required this.photo,
    required this.uploadPhoto,
    required this.remarks,
    required this.status,
    required this.reply,
    required this.complaintNumber,
    required this.complaintType,
    required this.service,
    required this.order,
    required this.customer,
  });

  factory ComplaintRegister.fromJson(Map<String, dynamic> json) => ComplaintRegister(
    complaintId: json["complaint_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    photo: json["photo"],
    uploadPhoto: json["upload_photo"],
    remarks: json["remarks"],
    status: json["status"],
    reply: json["reply"],
    complaintNumber: json["complaint_number"],
    complaintType: json["complaint_type"],
    service: json["service"],
    order: json["order"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "photo": photo,
    "upload_photo": uploadPhoto,
    "remarks": remarks,
    "status": status,
    "reply": reply,
    "complaint_number": complaintNumber,
    "complaint_type": complaintType,
    "service": service,
    "order": order,
    "customer": customer,
  };
}
