import 'package:peminjaman/controller/peminjamanlab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

class DetailPeminjamanLab extends StatelessWidget {
   DetailPeminjamanLab({Key? key}) : super(key: key);
final PeminjamanLabController peminjamanLabController = Get.put(PeminjamanLabController());

  @override
  Widget build(BuildContext context) {
    var _data = peminjamanLabController.dataDetailPeminjamanLab;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                  Positioned(top: 18, left: 18, child: randomAvatar('saytoonz', height: 50, width: 50)),
                  Positioned(top: 32, left: 82, child: Text(_data.user.name,style: const TextStyle(color: Colors.white,fontSize: 24.0),)),
                  Positioned(bottom: 24, left: 42, child: Text(_data.user.course,style: const TextStyle(color: Colors.white,fontSize: 28.0,fontWeight: FontWeight.w700),))
                ],
              ),
              const SizedBox(height: 16,),
              const  Text("Detail Peminjaman",style: TextStyle(color: Colors.blue),),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                     ListTile(
                      leading: const Icon(Icons.meeting_room_outlined,
                          color: Colors.blue, size: 28.0),
                      title: const Text("Lab "),
                      trailing: Text(_data.item.name),
                    ),
                    ListTile(
                        leading: const  Icon(Icons.meeting_room_outlined,color: Colors.blue, size: 28.0),
                        title: const Text("Nama Praktikum"),
                        trailing: Text(_data.name),
                      
                      ),
                       ListTile(
                      leading: const Icon(Icons.book_outlined,
                          color: Colors.blue, size: 28.0),
                      title: const Text("Mata Kuliah"),
                      trailing: Text(_data.course),
                    ),
                     ListTile(
                      leading: const Icon(Icons.person_outline,
                          color: Colors.blue, size: 28.0),
                      title: const Text("Dosen Pengajar"),
                      trailing: Text(_data.dosenName),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outlined,
                          color: Colors.blue, size: 28.0),
                      title: const Text("NIP Dosen Pengajar"),
                      trailing: Text(_data.dosenNip),
                    ),
                      ListTile(
                      leading: const Icon(Icons.calendar_month_sharp,
                          color: Colors.blue, size: 28.0),
                      title: const Text("Tanggal Pinjam"),
                      trailing: Text(_data.trxDate.toString().substring(0,10)),
                    ),
                      ListTile(
                      leading: const Icon(Icons.access_time,
                          color: Colors.blue, size: 28.0),
                      title: const Text("Jam Pinjam"),
                      trailing: Text(_data.startTime.substring(0,5)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
