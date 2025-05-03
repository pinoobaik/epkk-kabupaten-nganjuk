import 'dart:math';

import 'package:e_pkk_nganjuk/features/auth/data/model/role_bidang_list.dart';
import 'package:get/get.dart';

import '../../features/auth/data/model/dropdown_model.dart';

class PickRoleController extends GetxController {
  var kecamatanSelected = ''.obs;
  var selectedDesa = ''.obs;
  var selectedRoleBidang = ''.obs;
  String randomNumber = "1000";

  var desaList = <String>[].obs;
  var roleBidang = <String>[].obs;
  var selectedRoleBidangID = 0.obs;

  @override
  void onInit() {
    super.onInit();
    roleBidang.assignAll(RoleBidangList.roleBidangList);
    generateRandomNumber();
  }

  void updateKecamatan(String kecamatan) {
    kecamatanSelected.value = kecamatan;
    desaList.assignAll(kecamatanList.firstWhere((kec) => kec.name == kecamatan).desaList);
    selectedDesa.value = ''; // Reset the selectedDesa value
  }

  void updateDesa(String desa) {
    selectedDesa.value = desa;
  }

  void updateSelectedRole(String selectedRole) {
    selectedRoleBidang.value = selectedRole;
    // Ambil index dari role yang dipilih
    final index = RoleBidangList.roleBidangList.indexOf(selectedRole);
    
    // Ambil ID berdasarkan urutan index
    if (index != -1 && index < RoleBidangList.roleBidangIDList.length) {
      selectedRoleBidangID.value = RoleBidangList.roleBidangIDList[index];
    } else {
      selectedRoleBidangID.value = 0; // fallback jika role tidak ditemukan
    }
    print('Role bidang: $selectedRole (${selectedRoleBidangID.value})');
    // print('Role bidang: $selectedRoleBidang');
  }

  // Fungsi untuk mengenerate angka acak
  void generateRandomNumber() {
    Random random = new Random();
    randomNumber = (random.nextInt(9000) + 1000).toString();
    print('Generated Random Number: $randomNumber'); // Debug print
  }

  // Future<void> sendKodeOtp(String noHp) async {
  //   Uri url = Uri.parse(ApiHelper.url + 'otpWa.php');
  //
  //   if (randomNumber == 0) {
  //     generateRandomNumber();
  //   }
  //
  //   var data = {
  //     "kodeOtp": randomNumber.toString(),
  //     "noHp": noHp,
  //   };
  //   var response = await http.post(url, body: data);
  //   if (response.statusCode == 200) {
  //     var responseData = json.decode(response.body);
  //     print('Respon dari server: $responseData');
  //   } else {
  //     print('Gagal mengirim data. Kode status: ${response.statusCode}');
  //   }
  // }
}
