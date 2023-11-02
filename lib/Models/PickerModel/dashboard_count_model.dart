import 'dart:convert';

class DashboardCountModel {
  bool stats;
  DashboardData data;
  String message;

  DashboardCountModel({
    required this.stats,
    required this.data,
    required this.message,
  });

  DashboardCountModel copyWith({
    bool? stats,
    DashboardData? data,
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
    data: DashboardData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stats": stats,
    "data": data.toJson(),
    "message": message,
  };
}

class DashboardData {
  int newOrderCount;
  int confirmedOrderCount;
  int readyForDispatchCount;
  int deliveredCount;
  int notProcessedCount;
  int orderViaStaffCount;
  int undeliveredCount;
  int depositAmount;

  DashboardData({
    required this.newOrderCount,
    required this.confirmedOrderCount,
    required this.readyForDispatchCount,
    required this.deliveredCount,
    required this.notProcessedCount,
    required this.orderViaStaffCount,
    required this.undeliveredCount,
    required this.depositAmount,
  });

  DashboardData copyWith({
    int? newOrderCount,
    int? confirmedOrderCount,
    int? readyForDispatchCount,
    int? deliveredCount,
    int? notProcessedCount,
    int? orderViaStaffCount,
    int? undeliveredCount,
    int? depositAmount,
  }) =>
      DashboardData(
        newOrderCount: newOrderCount ?? this.newOrderCount,
        confirmedOrderCount: confirmedOrderCount ?? this.confirmedOrderCount,
        readyForDispatchCount: readyForDispatchCount ?? this.readyForDispatchCount,
        deliveredCount: deliveredCount ?? this.deliveredCount,
        notProcessedCount: notProcessedCount ?? this.notProcessedCount,
        orderViaStaffCount: orderViaStaffCount ?? this.orderViaStaffCount,
        undeliveredCount: undeliveredCount ?? this.undeliveredCount,
        depositAmount: depositAmount ?? this.depositAmount,
      );

  factory DashboardData.fromRawJson(String str) => DashboardData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    newOrderCount: json["new_order_count"],
    confirmedOrderCount: json["confirmed_order_count"],
    readyForDispatchCount: json["ready_for_dispatch_count"],
    deliveredCount: json["delivered_count"],
    notProcessedCount: json["not_processed_count"],
    orderViaStaffCount: json["order_via_staff_count"],
    undeliveredCount: json["undelivered_count"],
    depositAmount: json["deposit_amount"],
  );

  Map<String, dynamic> toJson() => {
    "new_order_count": newOrderCount,
    "confirmed_order_count": confirmedOrderCount,
    "ready_for_dispatch_count": readyForDispatchCount,
    "delivered_count": deliveredCount,
    "not_processed_count": notProcessedCount,
    "order_via_staff_count": orderViaStaffCount,
    "undelivered_count": undeliveredCount,
    "deposit_amount": depositAmount,
  };
}
