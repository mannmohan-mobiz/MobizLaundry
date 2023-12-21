// To parse this JSON data, do
//
//     final pickerConfirmedListModel = pickerConfirmedListModelFromJson(jsonString);

import 'dart:convert';

PickerConfirmedListModel pickerConfirmedListModelFromJson(String str) => PickerConfirmedListModel.fromJson(json.decode(str));

String pickerConfirmedListModelToJson(PickerConfirmedListModel data) => json.encode(data.toJson());

class PickerConfirmedListModel {
  bool status;
  List<pickerConfirmedList> data;
  String message;

  PickerConfirmedListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerConfirmedListModel.fromJson(Map<String, dynamic> json) => PickerConfirmedListModel(
    status: json["status"],
    data: List<pickerConfirmedList>.from(json["data"].map((x) => pickerConfirmedList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class pickerConfirmedList {
  String orderId;
  Customer customer;
  DatumCreatedBy? createdBy;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  PickupMode pickupMode;
  bool confirmPickup;
  DatumStatus status;
  OrderType orderType;
  String? totalAmount;
  OrderVia orderVia;
  DateTime orderDate;
  DateTime? deliveryDate;
  String? deliveryTime;
  bool paidStatus;
  dynamic discount;
  dynamic netTaxable;
  dynamic vat;
  dynamic grantTotal;
  String staff;
  dynamic invoice;

  pickerConfirmedList({
    required this.orderId,
    required this.customer,
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
    required this.staff,
    required this.invoice,
  });

  factory pickerConfirmedList.fromJson(Map<String, dynamic> json) => pickerConfirmedList(
    orderId: json["order_id"],
    customer: Customer.fromJson(json["customer"]),
    createdBy: datumCreatedByValues.map[json["created_by"]] ?? DatumCreatedBy.ASHOK,
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: pickupModeValues.map[json["Pickup_mode"]]!,
    confirmPickup: json["confirm_pickup"],
    status: datumStatusValues.map[json["status"]]!,
    orderType: orderTypeValues.map[json["order_type"]]!,
    totalAmount: json["total_amount"],
    orderVia: orderViaValues.map[json["order_via"]]!,
    orderDate: DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    staff: json["staff"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer.toJson(),
    "created_by": datumCreatedByValues.reverse[createdBy],
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupModeValues.reverse[pickupMode],
    "confirm_pickup": confirmPickup,
    "status": datumStatusValues.reverse[status],
    "order_type": orderTypeValues.reverse[orderType],
    "total_amount": totalAmount,
    "order_via": orderViaValues.reverse[orderVia],
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "staff": staff,
    "invoice": invoice,
  };
}

enum DatumCreatedBy {
  ASHOK
}

final datumCreatedByValues = EnumValues({
  "Ashok": DatumCreatedBy.ASHOK
});

class Customer {
  String customerId;
  Location location;
  CustomerCreatedBy createdBy;
  DateTime createdDate;
  CustomerName name;
  CustomerType customerType;
  String buildingNo;
  String roomNo;
  String mobile;
  String? altMobile;
  String? whatsApp;
  dynamic creditLimit;
  dynamic creditDays;
  dynamic creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  CustomerStatus status;
  dynamic trn;
  dynamic billingAddrs;
  dynamic designation;
  dynamic buildingName;
  dynamic floorNumber;
  dynamic flatNumber;
  dynamic altEmail;
  dynamic companyName;
  int user;
  String staff;
  String pricegroup;

  Customer({
    required this.customerId,
    required this.location,
    required this.createdBy,
    required this.createdDate,
    required this.name,
    required this.customerType,
    required this.buildingNo,
    required this.roomNo,
    required this.mobile,
    required this.altMobile,
    required this.whatsApp,
    required this.creditLimit,
    required this.creditDays,
    required this.creditInvoices,
    required this.gpse,
    required this.gpsn,
    required this.status,
    required this.trn,
    required this.billingAddrs,
    required this.designation,
    required this.buildingName,
    required this.floorNumber,
    required this.flatNumber,
    required this.altEmail,
    required this.companyName,
    required this.user,
    required this.staff,
    required this.pricegroup,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    location: Location.fromJson(json["Location"]),
    createdBy: customerCreatedByValues.map[json["created_by"]]!,
    createdDate: DateTime.parse(json["created_date"]),
    name: customerNameValues.map[json["name"]]!,
    customerType: customerTypeValues.map[json["customer_type"]]!,
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    whatsApp: json["whats_app"],
    creditLimit: json["credit_limit"],
    creditDays: json["credit_days"],
    creditInvoices: json["credit_invoices"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    status: customerStatusValues.map[json["status"]]!,
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    altEmail: json["alt_email"],
    companyName: json["company_name"],
    user: json["user"],
    staff: json["staff"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "Location": location.toJson(),
    "created_by": customerCreatedByValues.reverse[createdBy],
    "created_date": createdDate.toIso8601String(),
    "name": customerNameValues.reverse[name],
    "customer_type": customerTypeValues.reverse[customerType],
    "building_no": buildingNo,
    "room_no": roomNo,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "whats_app": whatsApp,
    "credit_limit": creditLimit,
    "credit_days": creditDays,
    "credit_invoices": creditInvoices,
    "GPSE": gpse,
    "GPSN": gpsn,
    "status": customerStatusValues.reverse[status],
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "alt_email": altEmail,
    "company_name": companyName,
    "user": user,
    "staff": staff,
    "Pricegroup": pricegroup,
  };
}

enum CustomerCreatedBy {
  MOBIZ
}

final customerCreatedByValues = EnumValues({
  "mobiz": CustomerCreatedBy.MOBIZ
});

enum CustomerType {
  HOME
}

final customerTypeValues = EnumValues({
  "Home": CustomerType.HOME
});

class Location {
  LocationName name;

  Location({
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: locationNameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": locationNameValues.reverse[name],
  };
}

enum LocationName {
  AL_KHAIL_GATE
}

final locationNameValues = EnumValues({
  "Al Khail Gate": LocationName.AL_KHAIL_GATE
});

enum CustomerName {
  DEEPESH_GEORGE,
  TEST
}

final customerNameValues = EnumValues({
  "Deepesh George": CustomerName.DEEPESH_GEORGE,
  "test": CustomerName.TEST
});

enum CustomerStatus {
  ACTIVE
}

final customerStatusValues = EnumValues({
  "Active": CustomerStatus.ACTIVE
});

enum OrderType {
  EXPRESS,
  NORMAL,
  URGENT
}

final orderTypeValues = EnumValues({
  "Express": OrderType.EXPRESS,
  "Normal": OrderType.NORMAL,
  "Urgent": OrderType.URGENT
});

enum OrderVia {
  VIA_APP,
  VIA_DIRECT,
  VIA_STAFF
}

final orderViaValues = EnumValues({
  "Via App": OrderVia.VIA_APP,
  "Via Direct": OrderVia.VIA_DIRECT,
  "Via Staff": OrderVia.VIA_STAFF
});

enum PickupMode {
  DIRECT,
  STAFF_PICK
}

final pickupModeValues = EnumValues({
  "Direct": PickupMode.DIRECT,
  "Staff Pick": PickupMode.STAFF_PICK
});

enum DatumStatus {
  CONFIRMED
}

final datumStatusValues = EnumValues({
  "Confirmed": DatumStatus.CONFIRMED
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
