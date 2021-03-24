import 'package:yumurtatakip2/database/database_utils.dart';

class MuhabbetYumurtaModel {
  int? id;
  int? yumurtaNo;
  int? aitCiftNo;
  int? catladiMi; // 0 = HAYIR , 1 = EVET !!!!! FOR HANDLE BOOLEAN VALUE.
  DateTime? yumurtlanmaTarihi;

  DateTime? yumurtaCatlamaTarihi; // (+18 GÜN)

  MuhabbetYumurtaModel(
      {this.id, this.yumurtaNo, this.aitCiftNo, this.yumurtlanmaTarihi,this.yumurtaCatlamaTarihi});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      yColumnId: id,
      yColumnYumurtaNo : yumurtaNo,
      yColumnAitCiftNo : aitCiftNo,
      yColumnYumurtlanmaTarihi : yumurtlanmaTarihi!.toIso8601String(),
      yColumnYumurtaCatlamaTarihi : yumurtlanmaTarihi!.add(Duration(days:18)).toIso8601String(),
    };
    return map;
  }

}
