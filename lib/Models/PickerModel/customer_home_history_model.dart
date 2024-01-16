// To parse this JSON data, do
//
//     final pickerCustomerHomeHistoryModel = pickerCustomerHomeHistoryModelFromJson(jsonString);

import 'dart:convert';

PickerCustomerHomeHistoryModel pickerCustomerHomeHistoryModelFromJson(String str) => PickerCustomerHomeHistoryModel.fromJson(json.decode(str));

String pickerCustomerHomeHistoryModelToJson(PickerCustomerHomeHistoryModel data) => json.encode(data.toJson());

class PickerCustomerHomeHistoryModel {
  bool status;
  List<CustomerHomeHistory> data;
  String message;

  PickerCustomerHomeHistoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerCustomerHomeHistoryModel.fromJson(Map<String, dynamic> json) => PickerCustomerHomeHistoryModel(
    status: json["status"],
    data: List<CustomerHomeHistory>.from(json["data"].map((x) => CustomerHomeHistory.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CustomerHomeHistory {
  String orderId;
  String orderNumber;
  String totalAmount;
  Status status;
  OrderType orderType;
  DateTime orderDate;
  DateTime? deliveryDate;
  int quantity;

  CustomerHomeHistory({
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    required this.orderType,
    required this.orderDate,
    required this.deliveryDate,
    required this.quantity,
  });

  factory CustomerHomeHistory.fromJson(Map<String, dynamic> json) => CustomerHomeHistory(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    status: statusValues.map[json["status"]]!,
    orderType: orderTypeValues.map[json["order_type"]]!,
    orderDate: DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "status": statusValues.reverse[status],
    "order_type": orderTypeValues.reverse[orderType],
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "quantity": quantity,
  };
}

enum OrderType {
  EXPRESS,
  NORMAL
}

final orderTypeValues = EnumValues({
  "Express": OrderType.EXPRESS,
  "Normal": OrderType.NORMAL
});

enum Status {
  CONFIRMATION_PENDING,
  CONFIRMED,
  HANDOVER,
  TRANSIT,
  UN_DELIVERED
}

final statusValues = EnumValues({
  "Confirmation Pending": Status.CONFIRMATION_PENDING,
  "Confirmed": Status.CONFIRMED,
  "Handover": Status.HANDOVER,
  "Transit": Status.TRANSIT,
  "UnDelivered": Status.UN_DELIVERED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
