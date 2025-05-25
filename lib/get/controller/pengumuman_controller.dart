import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/usecases/pengumuman_usecase.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';

class PengumumanController extends GetxController {
  final GetPengumumanUsecase getPengumumanUsecase;
  
  // List Observables
  var pengumumanList = <Pengumuman>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  

  PengumumanController({required this.getPengumumanUsecase});

  Future<void> loadPengumuman() async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final response = await getPengumumanUsecase.execute();
      
      if (response.statusCode == 200) {
        pengumumanList.assignAll(response.data); // Update list data
        print('Berhasil memuat ${pengumumanList.length} pengumuman');
      } else {
        errorMessage.value = response.message; // Error dari server
        print('Error: ${errorMessage.value}');
      }
    } on SocketException {
      errorMessage.value = 'Tidak ada koneksi internet';
    } on TimeoutException {
      errorMessage.value = 'Server tidak merespons';
    } catch (e) {
      errorMessage.value = 'Gagal memuat pengumuman: $e';
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: Sorting dari terbaru
  void sortByNewest() {
    pengumumanList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
  }
}