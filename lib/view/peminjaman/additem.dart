import 'package:peminjaman/controller/home_controller.dart';
import 'package:peminjaman/controller/peminjamanbarang_controller.dart';
import 'package:peminjaman/utilitis/utilites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPeminjamanBarang extends StatelessWidget {
  AddPeminjamanBarang({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final PeminjamanBarangController peminjamanBarangController =
      Get.put(PeminjamanBarangController());

  @override
  Widget build(BuildContext context) {
    homeController.getUserData();

    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Peminjaman Barang",style: TextStyle(color: Colors.black),),
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
                          controller: peminjamanBarangController.tglController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pilih Tanggal",
                          ),
                          onTap: () async {
                            peminjamanBarangController.chooseDate();
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Barang"),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[200])),
                        child: const Text(
                          'Pilih Barang',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              var dataBarang =
                                  peminjamanBarangController.listOptionBarang;
                              return Container(
                                height: 400,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: dataBarang.length,
                                          itemBuilder: (context, i) {
                                            var qtyExists =
                                                peminjamanBarangController
                                                    .listOptionBarangQty
                                                    .where((element) =>
                                                        element.id ==
                                                        dataBarang[i].id);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                margin: const EdgeInsets.all(8),
                                                elevation: 0.5,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(Icons
                                                        .meeting_room_outlined),
                                                    const SizedBox(
                                                      width: 16,
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              dataBarang[i]
                                                                  .name,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                                "Tersedia : ${dataBarang[i].qty.toString()}"),
                                                          ],
                                                        )),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: TextFormField(
                                                            // controller: _nameController,
                                                            onChanged:
                                                                (value) => {
                                                              peminjamanBarangController
                                                                  .addQtyBarangToArray(
                                                                      dataBarang[
                                                                              i]
                                                                          .name,
                                                                      dataBarang[
                                                                              i]
                                                                          .id,
                                                                      value)
                                                            },
                                                            decoration: InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText: qtyExists
                                                                        .isEmpty
                                                                    ? "Qty"
                                                                    : qtyExists
                                                                        .toList()[
                                                                            0]
                                                                        .qty
                                                                        .toString()),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        peminjamanBarangController.listOptionBarangQty.length,
                    itemBuilder: ((context, index) => ListTile(
                          leading: const Icon(Icons.room_preferences_outlined),
                          title: Text(peminjamanBarangController
                              .listOptionBarangQty[index].name),
                          subtitle: Text(peminjamanBarangController
                              .listOptionBarangQty[index].qty
                              .toString()),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                  padding:const  EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                  ),
                  child: Obx((){
                   return MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: peminjamanBarangController.isLoading.value
                              ? null
                              : (() {
                                  peminjamanBarangController.saveData();
                                  if (!peminjamanBarangController
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
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text("Simpan"),
                    );
                  })
                )
                // ElevatedButton(
                //           child: const Text("Simpan"),
                //           onPressed: peminjamanBarangController.isLoading.value
                //               ? null
                //               : (() {
                //                   peminjamanBarangController.saveData();
                //                   if (!peminjamanBarangController
                //                       .isLoading.value) {
                //                     successSnackBar(context, "suksess");
                //                     Future.delayed(
                //                         const Duration(milliseconds: 300), () {
                //                       // Do something
                //                       Get.back();
                //                     });
                //                   }
                //                 }),
                //         )
                        
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
