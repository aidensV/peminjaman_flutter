import 'package:peminjaman/controller/peminjamanbarang_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

class DetailPeminjamanBarang extends StatelessWidget {
   DetailPeminjamanBarang({Key? key}) : super(key: key);
final PeminjamanBarangController peminjamanBarangController = Get.put(PeminjamanBarangController());

  @override
  Widget build(BuildContext context) {
    var _data = peminjamanBarangController.detailPeminjamanAlat;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const  Text("Detail Barang",style: TextStyle(color: Colors.blue),),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _data.items.length,
                itemBuilder: ((context, index) => ListTile(
                  leading: const  Icon(Icons.meeting_room_outlined,color: Colors.blue, size: 28.0),
                  title: Text(_data.items[index].item.name),
                  trailing: Text(_data.items[index].qty.toString()),
                ))
                ),
            )
          ],
        ),
      ),
    );
  }
}
