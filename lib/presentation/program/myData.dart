import 'dart:convert';

class Day {
  String? name = "ll";

  Day({ this.name});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class TranferPosition {
  String? name;

  TranferPosition({this.name});

  factory TranferPosition.fromJson(Map<String, dynamic> json) {
    return TranferPosition(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class StudentData {
  Day? day;
  TranferPosition? transfer_position;
  String? start;
  String? end;
  String? confirmAttendance1;
  String? confirmAttendance2;
  StudentData(
      { this.day,
        this.transfer_position,
        this.start,
        this.end,
        this.confirmAttendance1, this.confirmAttendance2});

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
    day: Day.fromJson(json['day']),
    transfer_position: TranferPosition.fromJson(json['transfer_position']),
    start: json['start'],
    end: json['end'],
    confirmAttendance1:json['confirmAttendance1'] ,
    confirmAttendance2: json['confirmAttendance2'],
  );
}

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

class Payload {
  int? status;
  String? message;
  List<StudentData>? data;

  Payload({
    this.status,
    this.message,
    this.data,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    status: json["status"],
    message: json["message"],

    ///data: json['data'],
    data: List<StudentData>.from(
        json["data"].map((x) => StudentData.fromJson(x))).toList(),
  );
}

// class StudentData2 {
//   int? id;
//   int? user_id;
//   int? day_id;
//   int? transfer_position_id;
//   String? start;
//   String? end;
//   bool? confirmAttendance1;
//   String? confirmAttendance2;
//   StudentData2({
//     this.id,
//     this.user_id,
//     this.transfer_position_id,
//     this.start,
//     this.end,
//     this.confirmAttendance1,
//     this.confirmAttendance2});
//   factory StudentData2.fromJson(Map<String, dynamic> json) => StudentData2(
//     id: json['id'],
//     user_id: json['user_id'],
//     transfer_position_id: json['transfer_position_id'],
//     start: json['start'],
//     end: json['end'],
//     confirmAttendance1: json['confirmAttendance1'],
//     confirmAttendance2: json['confirmAttendance2'],
//   );
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'user_id': user_id,
//     'day_id': day_id,
//     'transfer_position_id': transfer_position_id,
//     'start': start,
//     ' end': end,
//     'confirmAttendance1': confirmAttendance1,
//     'confirmAttendance2': confirmAttendance2,
//   };
// }

// Payload2 payload2FromJson(String str) => Payload2.fromJson(json.decode(str));
//
// class Payload2 {
//   int status;
//   String message;
//   List<StudentData2> data;
//
//   Payload2({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory Payload2.fromJson(Map<String, dynamic> json) => Payload2(
//     status: json["status"],
//     message: json["message"],
//
//     ///data: json['data'],
//     data: List<StudentData2>.from(
//         json["data"].map((x) => StudentData2.fromJson(x))).toList(),
//   );
//
//   Map<String,dynamic> toJson()=>
//       {
//         'status':status,
//         ' message':message,
//         'data':data,
//       };
// }
