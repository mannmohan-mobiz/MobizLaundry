import 'dart:convert';

class ServiceComplaintListModel {
  bool status;
  List<ComplaintListData> data;
  String message;

  ServiceComplaintListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceComplaintListModel copyWith({
    bool? status,
    List<ComplaintListData>? data,
    String? message,
  }) =>
      ServiceComplaintListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceComplaintListModel.fromRawJson(String str) => ServiceComplaintListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceComplaintListModel.fromJson(Map<String, dynamic> json) => ServiceComplaintListModel(
    status: json["status"],
    data: List<ComplaintListData>.from(json["data"].map((x) => ComplaintListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ComplaintListData {
  String complaintId;
  ComplaintType complaintType;
  Order order;
  Service service;
  Customer customer;
  dynamic createdBy;
  DateTime createdDate;
  String? photo;
  String remarks;
  String status;
  dynamic reply;

  ComplaintListData({
    required this.complaintId,
    required this.complaintType,
    required this.order,
    required this.service,
    required this.customer,
    required this.createdBy,
    required this.createdDate,
    required this.photo,
    required this.remarks,
    required this.status,
    required this.reply,
  });

  ComplaintListData copyWith({
    String? complaintId,
    ComplaintType? complaintType,
    Order? order,
    Service? service,
    Customer? customer,
    dynamic createdBy,
    DateTime? createdDate,
    String? photo,
    String? remarks,
    String? status,
    dynamic reply,
  }) =>
      ComplaintListData(
        complaintId: complaintId ?? this.complaintId,
        complaintType: complaintType ?? this.complaintType,
        order: order ?? this.order,
        service: service ?? this.service,
        customer: customer ?? this.customer,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        photo: photo ?? this.photo,
        remarks: remarks ?? this.remarks,
        status: status ?? this.status,
        reply: reply ?? this.reply,
      );

  factory ComplaintListData.fromRawJson(String str) => ComplaintListData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComplaintListData.fromJson(Map<String, dynamic> json) => ComplaintListData(
    complaintId: json["complaint_id"],
    complaintType: ComplaintType.fromJson(json["complaint_type"]),
    order: Order.fromJson(json["order"]),
    service: Service.fromJson(json["service"]),
    customer: Customer.fromJson(json["customer"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    photo: json["photo"],
    remarks: json["remarks"],
    status: json["status"],
    reply: json["reply"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "complaint_type": complaintType.toJson(),
    "order": order.toJson(),
    "service": service.toJson(),
    "customer": customer.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "photo": photo,
    "remarks": remarks,
    "status": status,
    "reply": reply,
  };
}

class ComplaintType {
  String complaintType;

  ComplaintType({
    required this.complaintType,
  });

  ComplaintType copyWith({
    String? complaintType,
  }) =>
      ComplaintType(
        complaintType: complaintType ?? this.complaintType,
      );

  factory ComplaintType.fromRawJson(String str) => ComplaintType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComplaintType.fromJson(Map<String, dynamic> json) => ComplaintType(
    complaintType: json["complaint_type"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_type": complaintType,
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

class Order {
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

  Order({
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

  Order copyWith({
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
      Order(
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

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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

class Service {
  String categoryId;
  ServiceMaster serviceMaster;

  Service({
    required this.categoryId,
    required this.serviceMaster,
  });

  Service copyWith({
    String? categoryId,
    ServiceMaster? serviceMaster,
  }) =>
      Service(
        categoryId: categoryId ?? this.categoryId,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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

  ServiceMaster copyWith({
    String? categoryName,
    String? categoryImage,
  }) =>
      ServiceMaster(
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
