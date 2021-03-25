import 'package:get/get.dart';

import 'package:yumurtatakip2/database/database_helper.dart';
import 'package:yumurtatakip2/models/muhabbet_models/muhabbet_yumurta_model.dart';
import 'package:yumurtatakip2/database/database_utils.dart';

class YumurtaListController extends GetxController {
  var yumurtaList = <MuhabbetYumurtaModel>[].obs;
  int ? secilenCiftNo;


  @override
  void onInit() {
    super.onInit();
    secilenCiftNo = Get.arguments;
    _getYumurtaList(secilenCiftNo!);
  }

  void _getYumurtaList(int ciftNo) {
    DatabaseHelper.instance.querySecilenCiftYumurtalar(ciftNo).then((value) {
      value.forEach((element) {
        yumurtaList.add(MuhabbetYumurtaModel(
          id: element['$yColumnId'],
          aitCiftNo: element['$yColumnAitCiftNo'],
          yumurtaNo: element['$yColumnYumurtaNo'],
          yumurtlanmaTarihi: DateTime.parse(element['$yColumnYumurtlanmaTarihi']),
          yumurtaCatlamaTarihi: DateTime.parse(element['$yColumnYumurtaCatlamaTarihi']),
        ));
      });
    });
  }

  void addYumurta() async {
    await DatabaseHelper.instance.addYumurtaDb(MuhabbetYumurtaModel(
      aitCiftNo: secilenCiftNo,
      yumurtlanmaTarihi: DateTime.now(),
      yumurtaNo: 2,
      yumurtaCatlamaTarihi: DateTime.now(),
    ));
    yumurtaList.clear();
    _getYumurtaList(secilenCiftNo!);
  }

  void deleteYumurta(int id) async {
    await DatabaseHelper.instance.deleteYumurtaDb(id);

    yumurtaList.removeWhere((element) => element.id == id);
  }
}
