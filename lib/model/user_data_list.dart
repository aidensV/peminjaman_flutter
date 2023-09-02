
class UserDataList {
  static String name = '';
  static String email = '';
  static String token = '';
  static String course = '';
}

class UserInfoModel {
  int? uid;
  String name;
  String course;
  String email;

  UserInfoModel({
      this.uid,
    required this.name,
    required this.course,
    required this.email,
  });
}
