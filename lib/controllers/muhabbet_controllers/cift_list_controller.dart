import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumurtatakip2/database/database_helper.dart';
import 'package:yumurtatakip2/models/muhabbet_models/muhabbet_cift_model.dart';
import 'package:yumurtatakip2/views/muhabbet_kusu/muhabbet_yumurta_list/muhabbet_yumurta_list_screen.dart';

class CiftListController extends GetxController {
  var ciftList = <MuhabbetCiftModel>[].obs;
  late TextEditingController ciftNoTextController;

  @override
  void onInit() {
    super.onInit();
    ciftNoTextController = TextEditingController();
    _getCiftList();
  }

  void _getCiftList() {
    DatabaseHelper.instance.queryAllRowsCiftler().then((value) {
      value.forEach((map) {
        ciftList.add(MuhabbetCiftModel.fromMap(map));
      });
    });
  }

  void addCift(BuildContext context) async {
    if (ciftNoTextController.text.isEmpty) {
      buildSnackbarFalse();
    } else {
      await DatabaseHelper.instance.addCiftDb(
          MuhabbetCiftModel(ciftNo: int.parse(ciftNoTextController.text)));
      ciftList.clear();
      _getCiftList();
      ciftNoTextController.clear();
      Navigator.of(context).pop();
      buildSnackBarTrue();
    }
  }

  void buildSnackBarTrue() {
    return Get.snackbar(
      'Tebrikler',
      'Kayıt Başarılı',
      backgroundColor: Colors.green.shade400,
      duration: Duration(seconds: 3),
    );
  }

  void buildSnackbarFalse() {
    return Get.snackbar(
      'Kayıt Başarısız',
      'Lütfen bir çift numarası girin',
      backgroundColor: Colors.red.shade400,
      duration: Duration(seconds: 3),
    );
  }

  void deleteCift(int id) async {
    await DatabaseHelper.instance.deleteCiftDb(id);
    ciftList.removeWhere((element) => element.id == id);
  }

  void goYumurtaScreen(int ciftNo) {
    Get.to(() => MuhabbetYumurtaListScreen(), arguments: ciftNo);
  }
}
