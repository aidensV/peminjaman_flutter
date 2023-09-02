
import 'package:peminjaman/controller/home_controller.dart';
import 'package:peminjaman/controller/peminjamanlab_controller.dart';
import 'package:peminjaman/model/item.dart';
import 'package:peminjaman/utilitis/utilites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPeminjamanLab extends StatelessWidget {
  AddPeminjamanLab({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final PeminjamanLabController peminjamanLabController = Get.put(PeminjamanLabController());

  @override
  Widget build(BuildContext context) {
    homeController.getUserData();

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Peminjaman Lab",style: TextStyle(color:Colors.black),),
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
      
              // const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       const Text("Laboratorium"),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Obx(() => DropdownButton<String>(
                            value:
                                peminjamanLabController.selectedLab.value == ""
                                    ? null
                                    : peminjamanLabController.selectedLab.value,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            elevation: 16,
                            hint: const Text("Pilih Lab"),
                            dropdownColor: Colors.white,
                            style: const TextStyle(color: Colors.deepPurple),
                            onChanged: (String? value) {
                              peminjamanLabController.setSelectedLab(value!);
                            },
                            items: peminjamanLabController.listOptionLab
                                .map<DropdownMenuItem<String>>(
                                    (ItemsData value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name),
                              );
                            }).toList(),
                          )) ,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Praktikum"),
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
                          controller: peminjamanLabController.praktikumController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nama Praktikum",
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
                    const Text("Mata Kuliah"),
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
                          controller: peminjamanLabController.matkulController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nama Mata Kuliah",
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
                    const Text("Dosen Pengajar"),
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
                          controller: peminjamanLabController.dospenController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nama Dosen Pengajar",
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
                    const Text("NIP Dosen Pengajar"),
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
                          controller: peminjamanLabController.nipdospenController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "NIP Dosen Pengajar",
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
                    const Text("Tanggal"),
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
                          controller: peminjamanLabController.tglController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pilih Tanggal",
                          ),
                          onTap: () async {
                            peminjamanLabController.chooseDate();
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
                    const Text("Jam Mulai Pinjam"),
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
                          controller: peminjamanLabController.timeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pilih Jam",
                          ),
                          onTap: () async {
                          peminjamanLabController.chooseTime();
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
                            onPressed:
                             peminjamanLabController.isLoading.value
                              ? null
                              : (() {
                                  peminjamanLabController.saveData();
                                  if (!peminjamanLabController
                                      .isLoading.value) {
                                    successSnackBar(context, "suksess");
                                    Future.delayed(
                                        const Duration(milliseconds: 300), () {
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
                        }))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
