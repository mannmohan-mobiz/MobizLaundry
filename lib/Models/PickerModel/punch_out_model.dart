/// status : true
/// data : {"attendance_id":"4bd967fc-ddd2-465f-96f9-b1425804cfcc","created_by":null,"created_date":"2024-03-04T10:15:33.778821Z","punch_in_date":"2024-03-04","punch_in_time":"16:51:26.917860","punch_out_date":"2024-03-05","punch_out_time":"16:51:26.917717","staff":"20c15a06-0797-413b-823a-c533e52c047e"}
/// message : "Punchout succeesfully!"

class PunchOutModel {
  PunchOutModel({
      bool? status,
    PunchOut? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  PunchOutModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? PunchOut.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  PunchOut? _data;
  String? _message;
PunchOutModel copyWith({  bool? status,
  PunchOut? data,
  String? message,
}) => PunchOutModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  PunchOut? get data => _data;
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

/// attendance_id : "4bd967fc-ddd2-465f-96f9-b1425804cfcc"
/// created_by : null
/// created_date : "2024-03-04T10:15:33.778821Z"
/// punch_in_date : "2024-03-04"
/// punch_in_time : "16:51:26.917860"
/// punch_out_date : "2024-03-05"
/// punch_out_time : "16:51:26.917717"
/// staff : "20c15a06-0797-413b-823a-c533e52c047e"

class PunchOut {
  PunchOut({
      String? attendanceId, 
      dynamic createdBy, 
      String? createdDate, 
      String? punchInDate, 
      String? punchInTime, 
      String? punchOutDate, 
      String? punchOutTime, 
      String? staff,}){
    _attendanceId = attendanceId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _punchInDate = punchInDate;
    _punchInTime = punchInTime;
    _punchOutDate = punchOutDate;
    _punchOutTime = punchOutTime;
    _staff = staff;
}

  PunchOut.fromJson(dynamic json) {
    _attendanceId = json['attendance_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _punchInDate = json['punch_in_date'];
    _punchInTime = json['punch_in_time'];
    _punchOutDate = json['punch_out_date'];
    _punchOutTime = json['punch_out_time'];
    _staff = json['staff'];
  }
  String? _attendanceId;
  dynamic _createdBy;
  String? _createdDate;
  String? _punchInDate;
  String? _punchInTime;
  String? _punchOutDate;
  String? _punchOutTime;
  String? _staff;
  PunchOut copyWith({  String? attendanceId,
  dynamic createdBy,
  String? createdDate,
  String? punchInDate,
  String? punchInTime,
  String? punchOutDate,
  String? punchOutTime,
  String? staff,
}) => PunchOut(  attendanceId: attendanceId ?? _attendanceId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  punchInDate: punchInDate ?? _punchInDate,
  punchInTime: punchInTime ?? _punchInTime,
  punchOutDate: punchOutDate ?? _punchOutDate,
  punchOutTime: punchOutTime ?? _punchOutTime,
  staff: staff ?? _staff,
);
  String? get attendanceId => _attendanceId;
  dynamic get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get punchInDate => _punchInDate;
  String? get punchInTime => _punchInTime;
  String? get punchOutDate => _punchOutDate;
  String? get punchOutTime => _punchOutTime;
  String? get staff => _staff;

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
    return map;
  }

}