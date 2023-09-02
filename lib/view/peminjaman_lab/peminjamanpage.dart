import 'package:peminjaman/controller/peminjamanlab_controller.dart';
import 'package:peminjaman/view/peminjaman_lab/additem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeminjamanLabPage extends StatelessWidget {
   PeminjamanLabPage({Key? key}) : super(key: key);
final PeminjamanLabController peminjamanLabController = Get.put(PeminjamanLabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Peminjaman Lab",style: TextStyle(color: Colors.black),),
        
      ),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,

        child:  Column(
          children: [
            Expanded(
              child: Obx((() => peminjamanLabController.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: peminjamanLabController.listPeminjamanLab.length,
                    itemBuilder: (context, index) {
                      var _data = peminjamanLabController.listPeminjamanLab[index];
                      return Card(
                        elevation: 0.5,
                        child: ListTile(
                          onTap: (() => {
                            peminjamanLabController.detailPeminjamanLab(_data.id)
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
          Get.to(AddPeminjamanLab());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    
    );
  }
}