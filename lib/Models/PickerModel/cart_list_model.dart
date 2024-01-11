// To parse this JSON data, do
//
//     final pickerCartListModel = pickerCartListModelFromJson(jsonString);

import 'dart:convert';

PickerCartListModel pickerCartListModelFromJson(String str) => PickerCartListModel.fromJson(json.decode(str));

String pickerCartListModelToJson(PickerCartListModel data) => json.encode(data.toJson());

class PickerCartListModel {
  bool status;
  CartList data;
  String message;

  PickerCartListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerCartListModel.fromJson(Map<String, dynamic> json) => PickerCartListModel(
    status: json["status"],
    data: CartList.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class CartList {
  List<Cart> cart;
  int cartCount;
  String walletBalance;
  List<Map<String, String?>> deliveryAddress;

  CartList({
    required this.cart,
    required this.cartCount,
    required this.walletBalance,
    required this.deliveryAddress,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    cartCount: json["cart_count"],
    walletBalance: json["wallet_balance"],
    deliveryAddress: List<Map<String, String?>>.from(json["delivery_address"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
  );

  Map<String, dynamic> toJson() => {
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "cart_count": cartCount,
    "wallet_balance": walletBalance,
    "delivery_address": List<dynamic>.from(deliveryAddress.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  };
}

class Cart {
  String cartId;
  Order order;
  String quantity;
  String amount;
  ItemService itemService;
  String priceList;

  Cart({
    required this.cartId,
    required this.order,
    required this.quantity,
    required this.amount,
    required this.itemService,
    required this.priceList,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    order: Order.fromJson(json["order"]),
    quantity: json["quantity"],
    amount: json["amount"],
    itemService: ItemService.fromJson(json["item_service"]),
    priceList: json["price_list"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "order": order.toJson(),
    "quantity": quantity,
    "amount": amount,
    "item_service": itemService.toJson(),
    "price_list": priceList,
  };
}

class ItemService {
  String itemSerId;
  Item item;
  Category category;
  SubCategory subCategory;

  ItemService({
    required this.itemSerId,
    required this.item,
    required this.category,
    required this.subCategory,
  });

  factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
    itemSerId: json["item_ser_id"],
    item: Item.fromJson(json["item"]),
    category: Category.fromJson(json["category"]),
    subCategory: SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item.toJson(),
    "category": category.toJson(),
    "sub_category": subCategory.toJson(),
  };
}

class Category {
  String categoryId;
  ServiceMaster serviceMaster;

  Category({
    required this.categoryId,
    required this.serviceMaster,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    serviceMaster: ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster.toJson(),
  };
}

class ServiceMaster {
  String categoryName;
  String categoryImage;

  ServiceMaster({
    required this.categoryName,
    required this.categoryImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}

class Item {
  String itemId;
  String itemName;
  String itemImage;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemImage,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemId: json["item_id"],
    itemName: json["item_name"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "item_image": itemImage,
  };
}

class SubCategory {
  String subCatId;
  SubServiceMaster subServiceMaster;

  SubCategory({
    required this.subCatId,
    required this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: SubServiceMaster.fromJson(json["sub_service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster.toJson(),
  };
}

class SubServiceMaster {
  String subCatName;
  String subCatImage;

  SubServiceMaster({
    required this.subCatName,
    required this.subCatImage,
  });

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: json["sub_cat_name"],
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatName,
    "sub_cat_image": subCatImage,
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
  String? customerId;
  String? createdBy;
  DateTime? createdDate;
  String? name;
  String? customerType;
  String? buildingNo;
  String? roomNo;
  String? mobile;
  dynamic altMobile;
  String? whatsApp;
  dynamic creditLimit;
  dynamic creditDays;
  dynamic creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  String? status;
  dynamic trn;
  dynamic billingAddrs;
  dynamic designation;
  dynamic buildingName;
  dynamic floorNumber;
  dynamic flatNumber;
  dynamic altEmail;
  dynamic companyName;
  int? user;
  String? staff;
  String? location;
  String? pricegroup;

  Customer({
     this.customerId,
     this.createdBy,
     this.createdDate,
     this.name,
     this.customerType,
     this.buildingNo,
     this.roomNo,
     this.mobile,
     this.altMobile,
     this.whatsApp,
     this.creditLimit,
     this.creditDays,
     this.creditInvoices,
     this.gpse,
     this.gpsn,
     this.status,
     this.trn,
     this.billingAddrs,
     this.designation,
     this.buildingName,
     this.floorNumber,
     this.flatNumber,
     this.altEmail,
     this.companyName,
     this.user,
     this.staff,
     this.location,
     this.pricegroup,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    customerType: json["customer_type"],
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
    status: json["status"],
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
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "name": name,
    "customer_type": customerType,
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
    "status": status,
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
    "Location": location,
    "Pricegroup": pricegroup,
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
