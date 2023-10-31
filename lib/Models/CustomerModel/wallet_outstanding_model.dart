import 'dart:convert';

class CustomerBalanceModel {
  bool stats;
  CData data;
  String message;

  CustomerBalanceModel({
    required this.stats,
    required this.data,
    required this.message,
  });

  CustomerBalanceModel copyWith({
    bool? stats,
    CData? data,
    String? message,
  }) =>
      CustomerBalanceModel(
        stats: stats ?? this.stats,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CustomerBalanceModel.fromRawJson(String str) => CustomerBalanceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerBalanceModel.fromJson(Map<String, dynamic> json) => CustomerBalanceModel(
    stats: json["stats"],
    data: CData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stats": stats,
    "data": data.toJson(),
    "message": message,
  };
}

class CData {
  int walletBalance;
  int oustanding;

  CData({
    required this.walletBalance,
    required this.oustanding,
  });

  CData copyWith({
    int? walletBalance,
    int? oustanding,
  }) =>
      CData(
        walletBalance: walletBalance ?? this.walletBalance,
        oustanding: oustanding ?? this.oustanding,
      );

  factory CData.fromRawJson(String str) => CData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CData.fromJson(Map<String, dynamic> json) => CData(
    walletBalance: json["wallet_balance"],
    oustanding: json["oustanding"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_balance": walletBalance,
    "oustanding": oustanding,
  };
}
