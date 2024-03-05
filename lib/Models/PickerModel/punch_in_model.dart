/// status : true
/// data : {"attendance_id":"c18ee252-ce7e-414a-9096-c102bdf4f035","created_by":null,"created_date":"2024-03-05T12:24:19.164048Z","punch_in_date":"2024-03-05","punch_in_time":"12:24:19.164118","punch_out_date":null,"punch_out_time":null,"staff":"20c15a06-0797-413b-823a-c533e52c047e","punch_in_disabled":true}
/// message : "Punchin succeesfully!"

class PunchInModel {
  PunchInModel({
      bool? status,
     PunchIn? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  PunchInModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? PunchIn.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  PunchIn? _data;
  String? _message;
PunchInModel copyWith({  bool? status,
  PunchIn? data,
  String? message,
}) => PunchInModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  PunchIn? get data => _data;
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

/// attendance_id : "c18ee252-ce7e-414a-9096-c102bdf4f035"
/// created_by : null
/// created_date : "2024-03-05T12:24:19.164048Z"
/// punch_in_date : "2024-03-05"
/// punch_in_time : "12:24:19.164118"
/// punch_out_date : null
/// punch_out_time : null
/// staff : "20c15a06-0797-413b-823a-c533e52c047e"
/// punch_in_disabled : true

class PunchIn {
  PunchIn({
      String? attendanceId, 
      dynamic createdBy, 
      String? createdDate, 
      String? punchInDate, 
      String? punchInTime, 
      dynamic punchOutDate, 
      dynamic punchOutTime, 
      String? staff, 
      bool? punchInDisabled,}){
    _attendanceId = attendanceId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _punchInDate = punchInDate;
    _punchInTime = punchInTime;
    _punchOutDate = punchOutDate;
    _punchOutTime = punchOutTime;
    _staff = staff;
    _punchInDisabled = punchInDisabled;
}

  PunchIn.fromJson(dynamic json) {
    _attendanceId = json['attendance_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _punchInDate = json['punch_in_date'];
    _punchInTime = json['punch_in_time'];
    _punchOutDate = json['punch_out_date'];
    _punchOutTime = json['punch_out_time'];
    _staff = json['staff'];
    _punchInDisabled = json['punch_in_disabled'];
  }
  String? _attendanceId;
  dynamic _createdBy;
  String? _createdDate;
  String? _punchInDate;
  String? _punchInTime;
  dynamic _punchOutDate;
  dynamic _punchOutTime;
  String? _staff;
  bool? _punchInDisabled;
  PunchIn copyWith({  String? attendanceId,
  dynamic createdBy,
  String? createdDate,
  String? punchInDate,
  String? punchInTime,
  dynamic punchOutDate,
  dynamic punchOutTime,
  String? staff,
  bool? punchInDisabled,
}) => PunchIn(  attendanceId: attendanceId ?? _attendanceId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  punchInDate: punchInDate ?? _punchInDate,
  punchInTime: punchInTime ?? _punchInTime,
  punchOutDate: punchOutDate ?? _punchOutDate,
  punchOutTime: punchOutTime ?? _punchOutTime,
  staff: staff ?? _staff,
  punchInDisabled: punchInDisabled ?? _punchInDisabled,
);
  String? get attendanceId => _attendanceId;
  dynamic get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get punchInDate => _punchInDate;
  String? get punchInTime => _punchInTime;
  dynamic get punchOutDate => _punchOutDate;
  dynamic get punchOutTime => _punchOutTime;
  String? get staff => _staff;
  bool? get punchInDisabled => _punchInDisabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attendance_id'] = _attendanceId;
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['punch_in_date'] = _punchInDate;
    map['punch_in_time'] = _punchInTime;
    map['punch_out_date'] = _punchOutDate;
    map['punch_out_time'] = _punchOutTime;
    map['staff'] = _staff;
    map['punch_in_disabled'] = _punchInDisabled;
    return map;
  }

}