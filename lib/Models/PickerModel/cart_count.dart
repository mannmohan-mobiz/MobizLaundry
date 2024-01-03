// To parse this JSON data, do
//
//     final pickerCartCountModel = pickerCartCountModelFromJson(jsonString);

import 'dart:convert';

PickerCartCountModel pickerCartCountModelFromJson(String str) => PickerCartCountModel.fromJson(json.decode(str));

String pickerCartCountModelToJson(PickerCartCountModel data) => json.encode(data.toJson());

class PickerCartCountModel {
  bool status;
  Data data;
  String message;

  PickerCartCountModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerCartCountModel.fromJson(Map<String, dynamic> json) => PickerCartCountModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Order order;
  int cartCount;

  Data({
    required this.order,
    required this.cartCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    order: Order.fromJson(json["order"]),
    cartCount: json["cart_count"],
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "cart_count": cartCount,
  };
}

class Order {
  String orderId;
  Customer customer;
  Staff staff;
  String createdBy;
  DateTime createdDate;
  String orderNumber;
  dynamic pickupDate;
  dynamic pickupTime;
  String pickupMode;
  bool confirmPickup;
  String status;
  String orderType;
  String totalAmount;
  String orderVia;
  DateTime orderDate;
  DateTime deliveryDate;
  String deliveryTime;
  bool paidStatus;
  dynamic discount;
  dynamic netTaxable;
  dynamic vat;
  dynamic grantTotal;
  dynamic invoice;

  Order({
    required this.orderId,
    required this.customer,
    required this.staff,
    required this.createdBy,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupMode,
    required this.confirmPickup,
    required this.status,
    required this.orderType,
    required this.totalAmount,
    required this.orderVia,
    required this.orderDate,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.paidStatus,
    required this.discount,
    required this.netTaxable,
    required this.vat,
    required this.grantTotal,
    required this.invoice,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    customer: Customer.fromJson(json["customer"]),
    staff: Staff.fromJson(json["staff"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"],
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: DateTime.parse(json["order_date"]),
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer.toJson(),
    "staff": staff.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": pickupDate,
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "invoice": invoice,
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
  String perMobile;

  Staff({
    required this.staffId,
    required this.name,
    required this.curMobile,
    required this.perMobile,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    staffId: json["staff_id"],
    name: json["name"],
    curMobile: json["cur_mobile"],
    perMobile: json["per_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "name": name,
    "cur_mobile": curMobile,
    "per_mobile": perMobile,
  };
}
