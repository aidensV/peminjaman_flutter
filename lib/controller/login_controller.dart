import 'dart:convert';

import 'package:peminjaman/utilitis/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:peminjaman/view/Login/login.dart';

import '../utilitis/api_services.dart';
import '../view/HomePage/homepage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var isLoading = false.obs;
  var isObscure = true.obs;
  var isDataReadingCompleted = false.obs;

  loginWithDetails(String email, String pass) async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      ApiServices.email: email,
      ApiServices.password: pass,
    };
    try {
      var response =
          await http.post(Uri.parse(ApiServices.login), body: body);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Response:${response.body}");
        }
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = data['data'];
        if (result != null) {
          /*  UserDataList.email=UserDataModel.fromJson(data).data!.email.toString();
                     UserDataList.number=UserDataModel.fromJson(data).data!.userId.toString();
                     UserDataList.token=UserDataModel.fromJson(data).accessToken!;*/
          /* Data user=Data.fromJson(result);
                     await SharedPrefs().storeUser(json.encode(user));*/
          await SharedPrefs().isLogin(true);
          await SharedPrefs().saveToken(data['access_token']);
          if (kDebugMode) {
            print(await SharedPrefs().getIsLogin());
          }
          if (kDebugMode) {
            print("User details: ${result['name']}");
          }
          await SharedPrefs().storeUserData(json.encode(result));
          Get.offAll(Hompage());
          isDataReadingCompleted.value = true;
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  logout() async {
    isLoading.value = true;

    try {
      SharedPrefs prefs = SharedPrefs();
      var token = await prefs.getToken();
       if (token == null) {
         Get.offAll(LoginScreen());
       }
      String getToken = token;
              var header = {
        // 'Content-type': 'application/json',
        // 'Accept': 'application/json',
        "Authorization": getToken
      };
      
      var response = await http.post(Uri.parse(ApiServices.logout),headers: header);
      print(response.statusCode);
      if (response.statusCode == 200) {
          await SharedPrefs().prefsClear();
          Get.offAll(LoginScreen());
          isDataReadingCompleted.value = true;
          isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
}
