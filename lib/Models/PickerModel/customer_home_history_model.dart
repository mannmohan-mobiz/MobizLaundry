/// status : true
/// data : [{"order_id":"00d29081-6069-475b-b2df-3fa46fab7a84","order_number":"7204e1223","total_amount":"0","status":"Delivered","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2023-12-27","quantity":2},{"order_id":"01d6604b-9fc7-4f46-b4e0-57174c2ead66","order_number":"a3f9c1223","total_amount":"0","status":"Delivered","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2023-12-27","quantity":1},{"order_id":"ff75a9ff-2c84-438d-b292-ccede6e829df","order_number":"d15cb1223","total_amount":"66.0","status":"Handover","order_type":"Normal","order_date":"2024-02-21","Delivery_date":"2023-12-22","quantity":7}]
/// message : "Data passed successfully"

class CustomerHomeHistoryModel {
  CustomerHomeHistoryModel({
      bool? status, 
      List<CustomerHomeHistory>? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  CustomerHomeHistoryModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CustomerHomeHistory.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _status;
  List<CustomerHomeHistory>? _data;
  String? _message;
CustomerHomeHistoryModel copyWith({  bool? status,
  List<CustomerHomeHistory>? data,
  String? message,
}) => CustomerHomeHistoryModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  List<CustomerHomeHistory>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// order_id : "00d29081-6069-475b-b2df-3fa46fab7a84"
/// order_number : "7204e1223"
/// total_amount : "0"
/// status : "Delivered"
/// order_type : "Normal"
/// order_date : "2024-01-12"
/// Delivery_date : "2023-12-27"
/// quantity : 2

class CustomerHomeHistory {
  CustomerHomeHistory({
      String? orderId, 
      String? orderNumber, 
      String? totalAmount, 
      String? status, 
      String? orderType, 
      String? orderDate, 
      String? deliveryDate, 
      num? quantity,}){
    _orderId = orderId;
    _orderNumber = orderNumber;
    _totalAmount = totalAmount;
    _status = status;
    _orderType = orderType;
    _orderDate = orderDate;
    _deliveryDate = deliveryDate;
    _quantity = quantity;
}

  CustomerHomeHistory.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _orderNumber = json['order_number'];
    _totalAmount = json['total_amount'];
    _status = json['status'];
    _orderType = json['order_type'];
    _orderDate = json['order_date'];
    _deliveryDate = json['Delivery_date'];
    _quantity = json['quantity'];
  }
  String? _orderId;
  String? _orderNumber;
  String? _totalAmount;
  String? _status;
  String? _orderType;
  String? _orderDate;
  String? _deliveryDate;
  num? _quantity;
  CustomerHomeHistory copyWith({  String? orderId,
  String? orderNumber,
  String? totalAmount,
  String? status,
  String? orderType,
  String? orderDate,
  String? deliveryDate,
  num? quantity,
}) => CustomerHomeHistory(  orderId: orderId ?? _orderId,
  orderNumber: orderNumber ?? _orderNumber,
  totalAmount: totalAmount ?? _totalAmount,
  status: status ?? _status,
  orderType: orderType ?? _orderType,
  orderDate: orderDate ?? _orderDate,
  deliveryDate: deliveryDate ?? _deliveryDate,
  quantity: quantity ?? _quantity,
);
  String? get orderId => _orderId;
  String? get orderNumber => _orderNumber;
  String? get totalAmount => _totalAmount;
  String? get status => _status;
  String? get orderType => _orderType;
  String? get orderDate => _orderDate;
  String? get deliveryDate => _deliveryDate;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['order_number'] = _orderNumber;
    map['total_amount'] = _totalAmount;
    map['status'] = _status;
    map['order_type'] = _orderType;
    map['order_date'] = _orderDate;
    map['Delivery_date'] = _deliveryDate;
    map['quantity'] = _quantity;
    return map;
  }

}