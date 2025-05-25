import 'package:e_pkk_nganjuk/features/home/data/model/detail_laporan_model.dart';
import 'package:e_pkk_nganjuk/repositories/riwayat_repository.dart';
import 'package:e_pkk_nganjuk/usecases/detail_laporan_usecase.dart';
import 'package:get/get.dart';

class DetailLaporanController extends GetxController {
  final GetDetailLaporanUsecase getDetailLaporanUsecase;
  

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var laporanDetail = <String, dynamic>{}.obs;

  DetailLaporanController({required this.getDetailLaporanUsecase});

  Future<void> loadDetailLaporan({
    required String uuid,
    required int orgId,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await getDetailLaporanUsecase.execute(
        uuid: uuid,
        orgId: orgId,
      );

      if (response.statusCode == 200 && response.data != null) {
        laporanDetail.value = response.data!;
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = 'Gagal memuat detail: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateLaporan({
    required String uuid,
    required int orgId,
    required Map<String, dynamic> data,
  }) async {
    isLoading.value = true;
    try {
      await Get.find<RiwayatRepository>().updateLaporan(
        uuid: uuid,
        orgId: orgId,
        data: data,
      );
    } catch (e) {
      errorMessage.value = 'Gagal update: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cancelLaporan({
    required String uuid,
    required int orgId,
  }) async {
    try {
      await Get.find<RiwayatRepository>().cancelLaporan(
        uuid: uuid,
        orgId: orgId,
      );
    } catch (e) {
      print(e);
      throw Exception('Gagal membatalkan laporan: $e');
    }
  }
}

