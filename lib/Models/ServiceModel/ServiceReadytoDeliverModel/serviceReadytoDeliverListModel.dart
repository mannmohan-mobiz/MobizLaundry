import 'dart:convert';

class ServiceReadyToDeliverListModel {
  bool status;
  List<ReadytoDeliverOrderList> data;
  String message;

  ServiceReadyToDeliverListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceReadyToDeliverListModel copyWith({
    bool? status,
    List<ReadytoDeliverOrderList>? data,
    String? message,
  }) =>
      ServiceReadyToDeliverListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceReadyToDeliverListModel.fromRawJson(String str) => ServiceReadyToDeliverListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceReadyToDeliverListModel.fromJson(Map<String, dynamic> json) => ServiceReadyToDeliverListModel(
    status: json["status"],
    data: List<ReadytoDeliverOrderList>.from(json["data"].map((x) => ReadytoDeliverOrderList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ReadytoDeliverOrderList {
  String orderId;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  Staff staff;
  Customer customer;
  String orderType;
  String status;
  DateTime deliveryDate;
  String deliveryTime;

  ReadytoDeliverOrderList({
    required this.orderId,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.staff,
    required this.customer,
    required this.orderType,
    required this.status,
    required this.deliveryDate,
    required this.deliveryTime,
  });

  ReadytoDeliverOrderList copyWith({
    String? orderId,
    String? orderNumber,
    DateTime? pickupDate,
    String? pickupTime,
    Staff? staff,
    Customer? customer,
    String? orderType,
    String? status,
    DateTime? deliveryDate,
    String? deliveryTime,
  }) =>
      ReadytoDeliverOrderList(
        orderId: orderId ?? this.orderId,
        orderNumber: orderNumber ?? this.orderNumber,
        pickupDate: pickupDate ?? this.pickupDate,
        pickupTime: pickupTime ?? this.pickupTime,
        staff: staff ?? this.staff,
        customer: customer ?? this.customer,
        orderType: orderType ?? this.orderType,
        status: status ?? this.status,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
      );

  factory ReadytoDeliverOrderList.fromRawJson(String str) => ReadytoDeliverOrderList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReadytoDeliverOrderList.fromJson(Map<String, dynamic> json) => ReadytoDeliverOrderList(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    staff: Staff.fromJson(json["staff"]),
    customer: Customer.fromJson(json["customer"]),
    orderType: json["order_type"],
    status: json["status"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "staff": staff.toJson(),
    "customer": customer.toJson(),
    "order_type": orderType,
    "status": status,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
  };
}

class Customer {
  String customerId;
  String name;
  String mobile;

  Customer({
    required this.customerId,
    required this.name,
    required this.mobile,
  });

  Customer copyWith({
    String? customerId,
    String? name,
    String? mobile,
  }) =>
      Customer(
        customerId: customerId ?? this.customerId,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
      );

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    name: json["name"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "name": name,
    "mobile": mobile,
  };
}

class Staff {
  String staffId;
  String name;
  String curMobile;

  Staff({
    required this.staffId,
    required this.name,
    required this.curMobile,
  });

  Staff copyWith({
    String? staffId,
    String? name,
    String? curMobile,
  }) =>
      Staff(
        staffId: staffId ?? this.staffId,
        name: name ?? this.name,
        curMobile: curMobile ?? this.curMobile,
      );

  factory Staff.fromRawJson(String str) => Staff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    staffId: json["staff_id"],
    name: json["name"],
    curMobile: json["cur_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "name": name,
    "cur_mobile": curMobile,
  };
}
