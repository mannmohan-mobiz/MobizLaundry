// To parse this JSON data, do
//
//     final deliveryListModel = deliveryListModelFromJson(jsonString);

import 'dart:convert';

DeliveryListModel deliveryListModelFromJson(String str) => DeliveryListModel.fromJson(json.decode(str));

String deliveryListModelToJson(DeliveryListModel data) => json.encode(data.toJson());

class DeliveryListModel {
  bool status;
  DeliveryList data;
  String message;

  DeliveryListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryListModel.fromJson(Map<String, dynamic> json) => DeliveryListModel(
    status: json["status"],
    data: DeliveryList.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class DeliveryList {
  List<OrderList> orderList;
  int orderListCount;

  DeliveryList({
    required this.orderList,
    required this.orderListCount,
  });

  factory DeliveryList.fromJson(Map<String, dynamic> json) => DeliveryList(
    orderList: List<OrderList>.from(json["order_list"].map((x) => OrderList.fromJson(x))),
    orderListCount: json["order_list_count"],
  );

  Map<String, dynamic> toJson() => {
    "order_list": List<dynamic>.from(orderList.map((x) => x.toJson())),
    "order_list_count": orderListCount,
  };
}

class OrderList {
  String orderId;
  String customer;
  String customerName;
  Address address;
  String deliveryTime;
  String customerNumber;
  String orderType;

  OrderList({
    required this.orderId,
    required this.customer,
    required this.customerName,
    required this.address,
    required this.deliveryTime,
    required this.customerNumber,
    required this.orderType,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    orderId: json["order_id"],
    customer: json["customer"],
    customerName: json["customer_name"],
    address: Address.fromJson(json["address"]),
    deliveryTime: json["Delivery_time"],
    customerNumber: json["customer_number"],
    orderType: json["order_type"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer,
    "customer_name": customerName,
    "address": address.toJson(),
    "Delivery_time": deliveryTime,
    "customer_number": customerNumber,
    "order_type": orderType,
  };
}

class Address {
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String buildingName;
  String floorNumber;
  String flatNumber;

  Address({
    required this.name,
    required this.customerType,
    required this.buildingNo,
    required this.roomNo,
    required this.buildingName,
    required this.floorNumber,
    required this.flatNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
  };
}
