import 'package:peminjaman/controller/peminjamanbarang_controller.dart';
import 'package:peminjaman/view/peminjaman/additem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeminjamanPage extends StatelessWidget {
   PeminjamanPage({Key? key}) : super(key: key);
final PeminjamanBarangController peminjamanBarangController = Get.put(PeminjamanBarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Peminjaman",style: TextStyle(color: Colors.black),),
        
      ),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,

        child:  Column(
          children: [
            Expanded(
              child: Obx((() => peminjamanBarangController.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: peminjamanBarangController.listPeminjamanAlat.length,
                    itemBuilder: (context, index) {
                      var _data = peminjamanBarangController.listPeminjamanAlat[index];
                      return Card(
                        elevation: 0.5,
                        child: ListTile(
                          onTap: (() => {
                            peminjamanBarangController.detailPeminjamanBarang(_data.id)
                          }),
                          leading: const Icon(Icons.meeting_room_outlined),
                          title: Text(_data.user.name),
                          subtitle: Text(_data.user.course),
                          trailing: Text(_data.status),
                        ),
                      );
                    },
                  ))),
            ),
           const SizedBox(height: 52,)
          ],
        ),),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPeminjamanBarang());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    
    );
  }
}