import 'dart:convert';

class DashboardCountModel {
  bool stats;
  Data data;
  String message;

  DashboardCountModel({
    required this.stats,
    required this.data,
    required this.message,
  });

  DashboardCountModel copyWith({
    bool? stats,
    Data? data,
    String? message,
  }) =>
      DashboardCountModel(
        stats: stats ?? this.stats,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DashboardCountModel.fromRawJson(String str) => DashboardCountModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardCountModel.fromJson(Map<String, dynamic> json) => DashboardCountModel(
    stats: json["stats"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stats": stats,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int pickupPendingCount;
  int confirmedCount;
  int readyForDispatchCount;
  int deliveredCount;
  int notProcessedCount;
  String depositeAmount;
  int orderViaAppCount;
  int orderViaStaffCount;
  int orderViaDirectCount;

  Data({
    required this.pickupPendingCount,
    required this.confirmedCount,
    required this.readyForDispatchCount,
    required this.deliveredCount,
    required this.notProcessedCount,
    required this.depositeAmount,
    required this.orderViaAppCount,
    required this.orderViaStaffCount,
    required this.orderViaDirectCount,
  });

  Data copyWith({
    int? pickupPendingCount,
    int? confirmedCount,
    int? readyForDispatchCount,
    int? deliveredCount,
    int? notProcessedCount,
    String? depositeAmount,
    int? orderViaAppCount,
    int? orderViaStaffCount,
    int? orderViaDirectCount,
  }) =>
      Data(
        pickupPendingCount: pickupPendingCount ?? this.pickupPendingCount,
        confirmedCount: confirmedCount ?? this.confirmedCount,
        readyForDispatchCount: readyForDispatchCount ?? this.readyForDispatchCount,
        deliveredCount: deliveredCount ?? this.deliveredCount,
        notProcessedCount: notProcessedCount ?? this.notProcessedCount,
        depositeAmount: depositeAmount ?? this.depositeAmount,
        orderViaAppCount: orderViaAppCount ?? this.orderViaAppCount,
        orderViaStaffCount: orderViaStaffCount ?? this.orderViaStaffCount,
        orderViaDirectCount: orderViaDirectCount ?? this.orderViaDirectCount,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pickupPendingCount: json["pickup_pending_count"],
    confirmedCount: json["confirmed_count"],
    readyForDispatchCount: json["ready_for_dispatch_count"],
    deliveredCount: json["delivered_count"],
    notProcessedCount: json["not_processed_count"],
    depositeAmount: json["deposite_amount"].toString(),
    orderViaAppCount: json["order_via_app_count"],
    orderViaStaffCount: json["order_via_staff_count"],
    orderViaDirectCount: json["order_via_direct_count"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_pending_count": pickupPendingCount,
    "confirmed_count": confirmedCount,
    "ready_for_dispatch_count": readyForDispatchCount,
    "delivered_count": deliveredCount,
    "not_processed_count": notProcessedCount,
    "deposite_amount": depositeAmount,
    "order_via_app_count": orderViaAppCount,
    "order_via_staff_count": orderViaStaffCount,
    "order_via_direct_count": orderViaDirectCount,
  };
}
