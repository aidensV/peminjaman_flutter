
import 'package:peminjaman/controller/home_controller.dart';
import 'package:peminjaman/controller/pengajuanform_controller.dart';
import 'package:peminjaman/utilitis/utilites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPengajuanForm extends StatelessWidget {
  AddPengajuanForm({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final PengajuanFormController pengajuanFormController = Get.put(PengajuanFormController());

  @override
  Widget build(BuildContext context) {
    homeController.getUserData();

    return Scaffold(
      appBar: AppBar(
                  iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Pengajuan Form",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Username"),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          readOnly: true,
                          // controller: _nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: homeController.userDataInfo.value.name,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name of item';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Course"),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          readOnly: true,
                          // controller: _nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: homeController.userDataInfo.value.course,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name of item';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
       Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: Obx(() {
                          return MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            onPressed: pengajuanFormController.isLoading.value
                                ? null
                                : (() {
                                    pengajuanFormController.saveData();
                                    if (!pengajuanFormController
                                        .isLoading.value) {
                                      successSnackBar(context, "suksess");
                                      Future.delayed(
                                          const Duration(milliseconds: 300),
                                          () {
                                        // Do something
                                        Get.back();
                                      });
                                    }
                                  }),
                            color: Colors.yellow,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text("Simpan"),
                          );
                        }))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
