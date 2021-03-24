import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumurtatakip2/views/muhabbet_kusu/muhabbet_cift_list/muhabbet_cift_list_screen.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      home: MuhabbetCiftListScreen(),
    );
  }
}