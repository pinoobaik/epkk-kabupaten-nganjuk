import 'dart:convert';
import 'dart:math';

import 'package:e_pkk_nganjuk/features/auth/data/model/role_bidang_list.dart';
import 'package:e_pkk_nganjuk/repositories/auth_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../features/auth/data/model/dropdown_model.dart';

class PickRoleController extends GetxController {
  var kecamatanSelected = ''.obs;
  var selectedDesa = ''.obs;
  var selectedRoleBidang = ''.obs;
  String randomNumber = "1000";
  final AuthRepository authRepo = Get.find<AuthRepository>();

  var desaList = <String>[].obs;
  var roleBidang = <String>[].obs;
  var selectedRoleBidangID = 0.obs;

  @override
  void onInit() {
    super.onInit();
    roleBidang.assignAll(RoleBidangList.roleBidangList);
    //generateRandomNumber();
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
  // void generateRandomNumber() {
  //   Random random = new Random();
  //   randomNumber = (random.nextInt(9000) + 1000).toString();
  //   print('Generated Random Number: $randomNumber'); // Debug print
  // }

  // Future<void> sendOtpViaWhatsApp(String phoneNumber, String otp) async {
  //   try {
  //     await authRepo.sendOtpToWhatsApp(
  //       phoneNumber: phoneNumber,
  //       otp: otp,
  //     );
  //   } catch (e) {
  //     throw Exception('Error dari AuthRepository: $e');
  //   }
  // }
}
