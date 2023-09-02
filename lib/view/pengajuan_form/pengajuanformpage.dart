import 'package:peminjaman/controller/pengajuanform_controller.dart';
import 'package:peminjaman/view/pengajuan_form/additem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanFormPage extends StatelessWidget {
   PengajuanFormPage({Key? key}) : super(key: key);
final PengajuanFormController pengajuanFormController = Get.put(PengajuanFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Pengajuan Form",style: TextStyle(color: Colors.black),),
        
      ),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        child:  Column(
          children: [
            Expanded(
              child: Obx((() => pengajuanFormController.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: pengajuanFormController.listPengajuanForm.length,
                    itemBuilder: (context, index) {
                      var _data = pengajuanFormController.listPengajuanForm[index];
                      return Card(
                        elevation: 0.5,
                        child: ListTile(
                          onTap: (() => {
                            pengajuanFormController.detailPeminjamanLab(_data.id)
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
          Get.to(AddPengajuanForm());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    
    );
  }
}