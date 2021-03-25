import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumurtatakip2/constants/padding_constants.dart';
import 'package:yumurtatakip2/constants/radius_constants.dart';
import 'package:yumurtatakip2/controllers/muhabbet_controllers/cift_list_controller.dart';
import 'package:kartal/kartal.dart';
import 'package:yumurtatakip2/widgets/myTextFormField.dart';

part 'muhabbet_cift_list_strings.dart';

class MuhabbetCiftListScreen extends StatelessWidget {
  final _MuhabbetCiftListStrings stringValues = _MuhabbetCiftListStrings();
  late final CiftListController ciftListController = Get.put(CiftListController())! ;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildFloatingActionButton(context),
        body: Container(
          child: Obx(
            () => buildListView(),
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: ciftListController.ciftList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(index);
      },
    );
  }

  ListTile buildListTile(int index) {
    return ListTile(
      leading: Text(
        ciftListController.ciftList[index].ciftNo.toString() +
            stringValues.ciftString,
      ),
      onLongPress: () => ciftListController
          .deleteCift(ciftListController.ciftList[index].id!),
      onTap: () => ciftListController
          .goYumurtaScreen(ciftListController.ciftList[index].ciftNo!),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(context);
      },
      child: Icon(Icons.add),
    );
  }

  void showBottomSheet(BuildContext context) => showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: RadiusConstants.instance.circular24,
            topRight: RadiusConstants.instance.circular24,
          ),
        ),
        context: context,
        builder: (context) => Container(
          height: context.dynamicHeight(0.5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: PaddingConstants.instance.padding16301616,
                child: buildTextFormField(stringValues.addDescription,
                    ciftListController.ciftNoTextController),
              ),
              buildtextButton(context),
            ],
          ),
        ),
      );

  TextButton buildtextButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(),
      onPressed: () {
        ciftListController.addCift(context);
      },
      child: Text(
        stringValues.addButtonString,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
