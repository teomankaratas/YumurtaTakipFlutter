import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumurtatakip2/controllers/muhabbet_controllers/yumurta_list_controller.dart';
import 'package:yumurtatakip2/utils/format_utils.dart';

class MuhabbetYumurtaListScreen extends StatelessWidget {
  
  final yumurtaListController = Get.put(YumurtaListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            yumurtaListController!.addYumurta();
          },
        ),
        body: Container(
          child: Obx(
            () => ListView.builder(
              itemCount: yumurtaListController!.yumurtaList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    yumurtaListController!.yumurtaList[index].yumurtaNo.toString() +
                        '.Yumurta',

                  ),
                  title: Text(Formats.instance.dateFormat.format(yumurtaListController!.yumurtaList[index].yumurtlanmaTarihi!)),
                  subtitle: Text(Formats.instance.dateFormat.format(yumurtaListController!.yumurtaList[index].yumurtaCatlamaTarihi!)),
                  onLongPress:()=> yumurtaListController!.deleteYumurta(yumurtaListController!.yumurtaList[index].id!),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
