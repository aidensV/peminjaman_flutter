import 'package:peminjaman/view/peminjaman/peminjamanpage.dart';
import 'package:peminjaman/view/peminjaman_lab/peminjamanpage.dart';
import 'package:peminjaman/view/pengajuan_form/pengajuanformpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/login_controller.dart';

class Hompage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final HomeController homeController = Get.put(HomeController());
  Hompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeController.getUserData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: const Text(
          "Homepage",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("images/logo.png", width: 250),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "selamat datang di aplikasi e-Form laboratorium dan simulator",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              width: double.infinity,
              child:  DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Text('E-FORM'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Get.off(Hompage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.room_service,
              ),
              title: const Text('Peminjaman Alat'),
              onTap: () {
                Get.to(() => PeminjamanPage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.room_service,
              ),
              title: const Text('Peminjaman Lab'),
              onTap: () {
                Get.to(() => PeminjamanLabPage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.room_service,
              ),
              title: const Text('Pengajuan Form Clearance'),
              onTap: () {
                Get.to(() => PengajuanFormPage());
              },
            ),
           const  Spacer(),
             SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                   loginController.logout();
                }, child: const Text("Logout")))

            
          ],
        ),
        
      ),
      
    );
  }
}
