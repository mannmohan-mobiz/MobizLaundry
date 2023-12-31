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
  int pickupPendingCount;
  int confirmedCount;
  int readyForDispatchCount;
  int deliveredCount;
  int notProcessedCount;
  int orderViaStaffCount;
  int undeliveredCount;
  int depositAmount;
  int outstandingAmount;
  int topUpRequestCount;

  DashboardData({
    required this.pickupPendingCount,
    required this.confirmedCount,
    required this.readyForDispatchCount,
    required this.deliveredCount,
    required this.notProcessedCount,
    required this.orderViaStaffCount,
    required this.undeliveredCount,
    required this.depositAmount,
    required this.outstandingAmount,
    required this.topUpRequestCount,
  });

  DashboardData copyWith({
    int? pickupPendingCount,
    int? confirmedCount,
    int? readyForDispatchCount,
    int? deliveredCount,
    int? notProcessedCount,
    int? orderViaStaffCount,
    int? undeliveredCount,
    int? depositAmount,
    int? outstandingAmount,
    int? topUpRequestCount,
  }) =>
      DashboardData(
        pickupPendingCount: pickupPendingCount ?? this.pickupPendingCount,
        confirmedCount: confirmedCount ?? this.confirmedCount,
        readyForDispatchCount: readyForDispatchCount ?? this.readyForDispatchCount,
        deliveredCount: deliveredCount ?? this.deliveredCount,
        notProcessedCount: notProcessedCount ?? this.notProcessedCount,
        orderViaStaffCount: orderViaStaffCount ?? this.orderViaStaffCount,
        undeliveredCount: undeliveredCount ?? this.undeliveredCount,
        depositAmount: depositAmount ?? this.depositAmount,
        outstandingAmount: outstandingAmount ?? this.outstandingAmount,
        topUpRequestCount: topUpRequestCount ?? this.topUpRequestCount,

      );

  factory DashboardData.fromRawJson(String str) => DashboardData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    pickupPendingCount: json["pickup_pending_count"],
    confirmedCount: json["confirmed_count"],
    readyForDispatchCount: json["ready_for_dispatch_count"],
    deliveredCount: json["delivered_count"],
    notProcessedCount: json["not_processed_count"],
    orderViaStaffCount: json["order_via_staff_count"],
    undeliveredCount: json["undelivered_count"],
    depositAmount: json["deposit_amount"],
    outstandingAmount: json["outstanding_amount"],
    topUpRequestCount: json["topup_request_count"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_pending_count": pickupPendingCount,
    "confirmed_count": confirmedCount,
    "ready_for_dispatch_count": readyForDispatchCount,
    "delivered_count": deliveredCount,
    "not_processed_count": notProcessedCount,
    "order_via_staff_count": orderViaStaffCount,
    "undelivered_count": undeliveredCount,
    "deposit_amount": depositAmount,
    "outstanding_amount": outstandingAmount,
    "topup_request_count": topUpRequestCount,
  };
}
