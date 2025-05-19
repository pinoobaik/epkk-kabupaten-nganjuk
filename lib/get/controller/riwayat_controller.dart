// features/home/presentation/controllers/riwayat_controller.dart

import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/riwayat_model.dart';
import 'package:e_pkk_nganjuk/usecases/riwayat_usecase.dart';
import 'package:get/get.dart';

class RiwayatController extends GetxController {
  final GetRiwayatUsecase getRiwayatUsecase;

  var riwayatList = <Laporan>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  RiwayatController({required this.getRiwayatUsecase});

  Future<void> loadRiwayat({
    required String idUser,
    required String idRole,
    required String idOrganization,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await getRiwayatUsecase.execute(
        idUser: idUser,
        idRole: idRole,
        idOrganization: idOrganization,
      );

      if (response.statusCode == 200) {
        riwayatList.assignAll(response.data);
        print('Berhasil memuat ${riwayatList.length} riwayat laporan');
      } else {
        errorMessage.value = response.message;
        print('Error dari server: ${response.message}');
      }
    } on SocketException {
      errorMessage.value = 'Tidak ada koneksi internet';
    } on TimeoutException {
      errorMessage.value = 'Server tidak merespons';
    } catch (e) {
      errorMessage.value = 'Gagal memuat riwayat: $e';
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Opsional: urutkan riwayat berdasarkan tanggal terbaru
  void sortByNewest() {
    riwayatList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}
