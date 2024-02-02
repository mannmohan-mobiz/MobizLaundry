/// status : true
/// data : "c4eab0a4d77940d2b1c1260780eaa696"
/// message : "picker marked suceessfully"

class MarkAsPickedModel {
  MarkAsPickedModel({
      bool? status, 
      String? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  MarkAsPickedModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'];
    _message = json['message'];
  }
  bool? _status;
  String? _data;
  String? _message;
MarkAsPickedModel copyWith({  bool? status,
  String? data,
  String? message,
}) => MarkAsPickedModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  String? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }

}