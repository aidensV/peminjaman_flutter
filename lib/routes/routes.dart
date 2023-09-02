

import 'package:peminjaman/view/HomePage/dashbordbinding.dart';
import 'package:peminjaman/view/HomePage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/splash.dart';



const home = "/";
const dashboard = "/Hompage";

//const otp = "/otp";

final pages = [
  page(home, const SplashScreen(),null),
  page(dashboard, Hompage(),DashboardBinding()),

  //page(completeYourProfile, CompleteProfileScreen()),
  //page(otp, OtpScreen(),),
];

GetPage page(String name, Widget page,Bindings? binding) {
  return GetPage(
    name: name,
    page: () => page,
    binding: binding,
    transition: Transition.cupertino,
  );
}
