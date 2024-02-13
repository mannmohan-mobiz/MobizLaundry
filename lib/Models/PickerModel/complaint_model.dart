/// status : true
/// data : {"compliantlist":[{"complaint_id":"0d8bc66c-1735-4b50-9fa8-350d88fba611","complaint_type":"Delay in pickup","created_date":"2024-02-08","remark":"Testing one","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"d0636224"},{"complaint_id":"6a66a219-6d97-423e-8ad6-d2833055143f","complaint_type":"Delay in delivery","created_date":"2024-02-08","remark":"","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"81c1e224"},{"complaint_id":"9dcbd3f2-1144-437a-9665-9ecbcc060443","complaint_type":"Delay in pickup","created_date":"2024-02-08","remark":"testing","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"8b7f3224"},{"complaint_id":"7679026c-a68d-42c1-8e03-3bf4b8f6bb37","complaint_type":"Item Missing","created_date":"2024-02-08","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"4e97f224"},{"complaint_id":"2c403c39-2896-465b-a5ee-7364a868d194","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"f15d6224"},{"complaint_id":"acffd403-0649-4fef-a8bf-4f526163425f","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"1f4ab224"},{"complaint_id":"6085e2e9-de4d-4f18-92ee-4732bf635916","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"1b972224"},{"complaint_id":"2fe99b4c-c12a-4bb1-a7ca-144ee6d904c4","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"e63ff224"},{"complaint_id":"3cb9751e-50d8-4887-8c2a-d9201e3e1175","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"97ae2224"},{"complaint_id":"6a56a76a-d5df-4fef-8bfe-6d8cb9b50362","complaint_type":"Item Missing","created_date":"2024-02-06","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"a2379224"},{"complaint_id":"0c701cd1-edf8-4abc-bf0f-04221862bf2b","complaint_type":"Item Missing","created_date":"2024-02-06","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"fcd6e224"},{"complaint_id":"85b97c78-601d-43b6-a58b-aa2e9823c3b2","complaint_type":"Item Missing","created_date":"2024-02-05","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"9cee0224"},{"complaint_id":"05c5e67d-4383-46bf-b491-bd4dfb69af87","complaint_type":"Damage","created_date":"2024-02-04","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"bde07224"},{"complaint_id":"9548fcd7-51cb-434f-a510-d02d3c5f6702","complaint_type":"Damage","created_date":"2024-02-02","remark":null,"service":"Wash and Iron","order":"7204e1223","status":"Pending","complaint_number":null}],"count":14}
/// message : "Customer Complaints List!"

class ComplaintModel {
  ComplaintModel({
      bool? status,
    Complaint? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  ComplaintModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Complaint.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  Complaint? _data;
  String? _message;
ComplaintModel copyWith({  bool? status,
  Complaint? data,
  String? message,
}) => ComplaintModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  Complaint? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// compliantlist : [{"complaint_id":"0d8bc66c-1735-4b50-9fa8-350d88fba611","complaint_type":"Delay in pickup","created_date":"2024-02-08","remark":"Testing one","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"d0636224"},{"complaint_id":"6a66a219-6d97-423e-8ad6-d2833055143f","complaint_type":"Delay in delivery","created_date":"2024-02-08","remark":"","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"81c1e224"},{"complaint_id":"9dcbd3f2-1144-437a-9665-9ecbcc060443","complaint_type":"Delay in pickup","created_date":"2024-02-08","remark":"testing","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"8b7f3224"},{"complaint_id":"7679026c-a68d-42c1-8e03-3bf4b8f6bb37","complaint_type":"Item Missing","created_date":"2024-02-08","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"4e97f224"},{"complaint_id":"2c403c39-2896-465b-a5ee-7364a868d194","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"f15d6224"},{"complaint_id":"acffd403-0649-4fef-a8bf-4f526163425f","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"1f4ab224"},{"complaint_id":"6085e2e9-de4d-4f18-92ee-4732bf635916","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"1b972224"},{"complaint_id":"2fe99b4c-c12a-4bb1-a7ca-144ee6d904c4","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"e63ff224"},{"complaint_id":"3cb9751e-50d8-4887-8c2a-d9201e3e1175","complaint_type":"Item Missing","created_date":"2024-02-07","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"97ae2224"},{"complaint_id":"6a56a76a-d5df-4fef-8bfe-6d8cb9b50362","complaint_type":"Item Missing","created_date":"2024-02-06","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"a2379224"},{"complaint_id":"0c701cd1-edf8-4abc-bf0f-04221862bf2b","complaint_type":"Item Missing","created_date":"2024-02-06","remark":"damaged","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"fcd6e224"},{"complaint_id":"85b97c78-601d-43b6-a58b-aa2e9823c3b2","complaint_type":"Item Missing","created_date":"2024-02-05","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"9cee0224"},{"complaint_id":"05c5e67d-4383-46bf-b491-bd4dfb69af87","complaint_type":"Damage","created_date":"2024-02-04","remark":"hi","service":"Dry Cleaning","order":"8bdbd124","status":"Pending","complaint_number":"bde07224"},{"complaint_id":"9548fcd7-51cb-434f-a510-d02d3c5f6702","complaint_type":"Damage","created_date":"2024-02-02","remark":null,"service":"Wash and Iron","order":"7204e1223","status":"Pending","complaint_number":null}]
/// count : 14

class Complaint {
  Complaint({
      List<Compliantlist>? compliantlist, 
      num? count,}){
    _compliantlist = compliantlist;
    _count = count;
}

  Complaint.fromJson(dynamic json) {
    if (json['compliantlist'] != null) {
      _compliantlist = [];
      json['compliantlist'].forEach((v) {
        _compliantlist?.add(Compliantlist.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Compliantlist>? _compliantlist;
  num? _count;
  Complaint copyWith({  List<Compliantlist>? compliantlist,
  num? count,
}) => Complaint(  compliantlist: compliantlist ?? _compliantlist,
  count: count ?? _count,
);
  List<Compliantlist>? get compliantlist => _compliantlist;
  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_compliantlist != null) {
      map['compliantlist'] = _compliantlist?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// complaint_id : "0d8bc66c-1735-4b50-9fa8-350d88fba611"
/// complaint_type : "Delay in pickup"
/// created_date : "2024-02-08"
/// remark : "Testing one"
/// service : "Dry Cleaning"
/// order : "8bdbd124"
/// status : "Pending"
/// complaint_number : "d0636224"

class Compliantlist {
  Compliantlist({
      String? complaintId, 
      String? complaintType, 
      String? createdDate, 
      String? remark, 
      String? service, 
      String? order, 
      String? status, 
      String? complaintNumber,}){
    _complaintId = complaintId;
    _complaintType = complaintType;
    _createdDate = createdDate;
    _remark = remark;
    _service = service;
    _order = order;
    _status = status;
    _complaintNumber = complaintNumber;
}

  Compliantlist.fromJson(dynamic json) {
    _complaintId = json['complaint_id'];
    _complaintType = json['complaint_type'];
    _createdDate = json['created_date'];
    _remark = json['remark'];
    _service = json['service'];
    _order = json['order'];
    _status = json['status'];
    _complaintNumber = json['complaint_number'];
  }
  String? _complaintId;
  String? _complaintType;
  String? _createdDate;
  String? _remark;
  String? _service;
  String? _order;
  String? _status;
  String? _complaintNumber;
Compliantlist copyWith({  String? complaintId,
  String? complaintType,
  String? createdDate,
  String? remark,
  String? service,
  String? order,
  String? status,
  String? complaintNumber,
}) => Compliantlist(  complaintId: complaintId ?? _complaintId,
  complaintType: complaintType ?? _complaintType,
  createdDate: createdDate ?? _createdDate,
  remark: remark ?? _remark,
  service: service ?? _service,
  order: order ?? _order,
  status: status ?? _status,
  complaintNumber: complaintNumber ?? _complaintNumber,
);
  String? get complaintId => _complaintId;
  String? get complaintType => _complaintType;
  String? get createdDate => _createdDate;
  String? get remark => _remark;
  String? get service => _service;
  String? get order => _order;
  String? get status => _status;
  String? get complaintNumber => _complaintNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['complaint_id'] = _complaintId;
    map['complaint_type'] = _complaintType;
    map['created_date'] = _createdDate;
    map['remark'] = _remark;
    map['service'] = _service;
    map['order'] = _order;
    map['status'] = _status;
    map['complaint_number'] = _complaintNumber;
    return map;
  }

}