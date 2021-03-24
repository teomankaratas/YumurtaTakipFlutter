import 'dart:convert';

import 'package:yumurtatakip2/database/database_utils.dart';

class MuhabbetCiftModel {
  int? id;
  int? ciftNo;

  MuhabbetCiftModel({this.id, this.ciftNo});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnId: id,
      columnCiftNo: ciftNo,
    };
    return map;
  }

  factory MuhabbetCiftModel.fromMap(Map<String, dynamic> map) {
    return MuhabbetCiftModel(
      id: map[columnId],
      ciftNo: map[columnCiftNo],
    );
  }

  String toJson() => json.encode(toMap());

  factory MuhabbetCiftModel.fromJson(String source) =>
      MuhabbetCiftModel.fromMap(json.decode(source));
}
