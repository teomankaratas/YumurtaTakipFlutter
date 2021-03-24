import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumurtatakip2/database/database_helper.dart';
import 'package:yumurtatakip2/models/muhabbet_models/muhabbet_cift_model.dart';
import 'package:yumurtatakip2/database/database_utils.dart';
import 'package:yumurtatakip2/views/muhabbet_kusu/muhabbet_yumurta_list/muhabbet_yumurta_list_screen.dart';

class CiftListController extends GetxController {
  var ciftList = <MuhabbetCiftModel>[].obs;
  TextEditingController? ciftNoTextController;

  @override
  void onInit() {
    super.onInit();
    ciftNoTextController = TextEditingController();
    _getCiftList();
  }

  void _getCiftList() {
    DatabaseHelper.instance.queryAllRowsCiftler().then((value) {
      value.forEach((element) {
        ciftList.add(MuhabbetCiftModel(
            id: element['$columnId'], ciftNo: element['$columnCiftNo']));
      });
    });
  }

  void addCift(BuildContext context) async {
    if (ciftNoTextController!.text.isEmpty) {
      Get.snackbar(
        'Kayıt Başarısız',
        'Lütfen bir çift numarası girin',
        backgroundColor: Colors.red.shade400,
        duration: Duration(seconds: 3),
      );
    } else {
      await DatabaseHelper.instance.addCiftDb(
          MuhabbetCiftModel(ciftNo: int.parse(ciftNoTextController!.text)));
      ciftList.clear();
      _getCiftList();
      ciftNoTextController!.clear();
      Navigator.of(context).pop();
      Get.snackbar(
        'Tebrikler',
        'Kayıt Başarılı',
        backgroundColor: Colors.green.shade400,
        duration: Duration(seconds: 3),
      );
    }
  }

  void deleteCift(int id) async {
    await DatabaseHelper.instance.deleteCiftDb(id);
    ciftList.removeWhere((element) => element.id == id);
  }

  void goYumurtaScreen(int ciftNo) {
    Get.to(() => MuhabbetYumurtaListScreen(), arguments: ciftNo);
  }
}
