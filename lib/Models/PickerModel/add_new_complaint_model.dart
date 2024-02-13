// To parse this JSON data, do
//
//     final addNewComplaintModel = addNewComplaintModelFromJson(jsonString);

import 'dart:convert';

AddNewComplaintModel addNewComplaintModelFromJson(String str) => AddNewComplaintModel.fromJson(json.decode(str));

String addNewComplaintModelToJson(AddNewComplaintModel data) => json.encode(data.toJson());

class AddNewComplaintModel {
  bool status;
  AddNewComplaint data;
  String message;

  AddNewComplaintModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AddNewComplaintModel.fromJson(Map<String, dynamic> json) => AddNewComplaintModel(
    status: json["status"],
    data: AddNewComplaint.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class AddNewComplaint {
  List<DeliverdOrder> deliverdOrders;
  List<TypesOfCpmpliance> typesOfCpmpliance;

  AddNewComplaint({
    required this.deliverdOrders,
    required this.typesOfCpmpliance,
  });

  factory AddNewComplaint.fromJson(Map<String, dynamic> json) => AddNewComplaint(
    deliverdOrders: List<DeliverdOrder>.from(json["deliverd_orders"].map((x) => DeliverdOrder.fromJson(x))),
    typesOfCpmpliance: List<TypesOfCpmpliance>.from(json["types_of_cpmpliance"].map((x) => TypesOfCpmpliance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "deliverd_orders": List<dynamic>.from(deliverdOrders.map((x) => x.toJson())),
    "types_of_cpmpliance": List<dynamic>.from(typesOfCpmpliance.map((x) => x.toJson())),
  };
}

class DeliverdOrder {
  String orderId;
  String orderNumber;
  String totalAmount;
  DateTime deliveryDate;
  String status;
  int quantity;

  DeliverdOrder({
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.deliveryDate,
    required this.status,
    required this.quantity,
  });

  factory DeliverdOrder.fromJson(Map<String, dynamic> json) => DeliverdOrder(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    status: json["status"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "status": status,
    "quantity": quantity,
  };
}

class TypesOfCpmpliance {
  String complaintId;
  String complaintType;

  TypesOfCpmpliance({
    required this.complaintId,
    required this.complaintType,
  });

  factory TypesOfCpmpliance.fromJson(Map<String, dynamic> json) => TypesOfCpmpliance(
    complaintId: json["complaint_id"],
    complaintType: json["complaint_type"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "complaint_type": complaintType,
  };
}
