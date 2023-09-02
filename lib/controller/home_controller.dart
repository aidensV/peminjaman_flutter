import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/user_data_list.dart';
import '../utilitis/shared_prefs.dart';

class HomeController extends GetxController{
  final userDataInfo=UserInfoModel(course: '',email: '',name: "").obs;


  getUserData() async{
    SharedPrefs prefs=SharedPrefs();
    var userInfo= json.decode(await prefs.getUserData());

    userDataInfo.update((userDataInfo) {
      userDataInfo!.course= userInfo['course'];
      userDataInfo.email= userInfo['email'];
      userDataInfo.uid= userInfo['id'];
      userDataInfo.name = userInfo['name'];

    });
    UserInfoModel(
      email: userInfo['email'],course: userInfo['course'],
        name: userInfo['name']
    );
    if (kDebugMode) {
      print("Home User details: $userInfo \n Home User Name: ${userInfo['name']}");
    }

  /*  var user=jsonEncode(userInfo);
    Data.fromJson(jsonEncode(userInfo))*/
    //Map<String,dynamic> map =jsonEncode(userInfo);
   // print(map.);

  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }
}