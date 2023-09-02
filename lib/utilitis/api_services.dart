class ApiServices{
  static String baseUrl = 'https://labssim-eform.my.id/api';
  static String login = '$baseUrl/login';
  static String logout = '$baseUrl/logout';
  static String saveBarang = '$baseUrl/barang/save';
  static String saveLab = '$baseUrl/lab/save';
  static String savePengajuanForm='$baseUrl/form/save';
  static String getBarang = '$baseUrl/util-getbarang';
  static String getLab='$baseUrl/util-getlab';
  static String listPeminjamanBarang = '$baseUrl/barang';
  static String listPeminjamanLab = '$baseUrl/lab';
  static String listPengajuanForm= '$baseUrl/pengajuan-form';

  static String email='email';
  static String password = 'password';
  static String name ='name';
  static String description = 'description';
  
}
class UserInfo{
  static String userID='id';
  static String userName='name';
  static String userNumber='number';
  static String userEmail='email';
}