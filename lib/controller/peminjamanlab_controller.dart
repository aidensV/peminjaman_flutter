import 'dart:async';
import 'dart:convert';

import 'package:peminjaman/model/item.dart';
import 'package:peminjaman/model/peminjaman_lab.dart';
import 'package:peminjaman/utilitis/api_services.dart';
import 'package:peminjaman/utilitis/shared_prefs.dart';
import 'package:peminjaman/view/peminjaman_lab/detailitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class PeminjamanLabController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController tglController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController praktikumController = TextEditingController();
  TextEditingController matkulController = TextEditingController();
  TextEditingController dospenController = TextEditingController();
  TextEditingController nipdospenController = TextEditingController();
List<PeminjamanLab> listPeminjamanLab = <PeminjamanLab>[].obs;
late PeminjamanLab dataDetailPeminjamanLab ;
  List<ItemsData> listOptionLab = <ItemsData>[].obs;
  var selectedOption = ''.obs;
  var isLoading = false.obs;
  var isDataReadingCompleted = false.obs;
  var resultMessage = ''.obs;
  final selectedLab = "".obs;

  Timer? _debounce;
  @override
  void onInit() async {
    listDataPeminjaman();
    getLab();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    listDataPeminjaman();
  }

  @override
  void onClose() {
    // listDataPeminjaman();
    timeController.clear();
    _debounce?.cancel();
    super.onClose();
  }

  detailPeminjamanLab(int id) {
     dataDetailPeminjamanLab = listPeminjamanLab.firstWhere((element) => element.id == id,);
    Get.to(() => DetailPeminjamanLab());
  }

  void setSelectedLab(String value) {
    selectedLab.value = value;
  }

  getLab() async {
    SharedPrefs prefs = SharedPrefs();
    var token = await prefs.getToken();
    String getToken = token;
    isLoading.value = true;

    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": getToken
    };
    try {
      var response =
          await http.get(Uri.parse(ApiServices.getLab), headers: header);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List result = data['data'];
        isDataReadingCompleted.value = true;
        isLoading.value = false;
        listOptionLab =
            result.map((items) => ItemsData.fromJson(items)).toList();

        // for (var element in listOptionBarang) {
        //   print(element.name);
        // }
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception('Unexpected error occured!');
    }
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      tglController.text = formattedDate;
    }
  }

  chooseTime() async{
   TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if(pickedTime != null){
      String formattedTime = pickedTime.format(Get.context!);
     
      DateTime formatTime24 = DateFormat("hh:mma").parse(formattedTime.removeAllWhitespace);
      timeController.text = DateFormat("HH:mm").format(formatTime24);
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  listDataPeminjaman() async {
    SharedPrefs prefs = SharedPrefs();
    var token = await prefs.getToken();
    String getToken = token;
    isLoading.value = true;

    var header = {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      "Authorization": getToken
    };

    try {
      var response = await http.get(Uri.parse(ApiServices.listPeminjamanLab),
          headers: header);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List result = data['data'];
         listPeminjamanLab = result.map((items) => PeminjamanLab.fromJson(items)).toList();
        isDataReadingCompleted.value = true;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        resultMessage.value = 'terjadi kesalahan';
      }
    } catch (e) {
      //  resultMessage = ;
      isLoading.value = false;
    }
  }

  saveData() async {
    SharedPrefs prefs = SharedPrefs();
    var token = await prefs.getToken();
    String getToken = token;
    isLoading.value = true;
    //  var bodyBarangJson = jsonEncode(listOptionBarangQty.map((e) => e.toJson()).toList());
    var header = {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      "Authorization": getToken
    };
    Map<String, dynamic> body = {
      "date_trx": tglController.text,
      "start_jam": timeController.text,
      "items": selectedLab.value,
      "dosen_name": dospenController.text,
      "dosen_nip": nipdospenController.text,
      "name": praktikumController.text,
    };
    try {
      var response = await http.post(Uri.parse(ApiServices.saveLab),headers: header, body: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = data['data'];
        if (result != null) {
          isDataReadingCompleted.value = true;
          isLoading.value = false;
          resultMessage.value = data["message"];
        }
      } else {
        isLoading.value = false;
        resultMessage.value = 'terjadi kesalahan' ;
      }
    } catch (e) {
      //  resultMessage = ;
      isLoading.value = false;
    }
  }
}
