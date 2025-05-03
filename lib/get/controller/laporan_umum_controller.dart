import 'package:e_pkk_nganjuk/features/home/data/model/report_laporan_umum_model.dart';
import 'package:e_pkk_nganjuk/usecases/laporan_umum_usecase.dart';
import 'package:get/get.dart';

class LaporanUmumController extends GetxController {
  final CreateUmumUsecase createUmumUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportUmumModel>();

  LaporanUmumController({required this.createUmumUsecase});

  Future<void> submitUmumData({
    required String idUser,
    required String dusunLingkungan,
    required String pkkRw,
    required String desaWisma,
    required String krt,
    required String kk,
    required String jiwaLaki,
    required String jiwaPerempuan,
    required String anggotaLaki,
    required String anggotaPerempuan,
    required String umumLaki,
    required String umumPerempuan,
    required String khususLaki,
    required String khususPerempuan,
    required String honorerLaki,
    required String honorerPerempuan,
    required String bantuanLaki,
    required String bantuanPerempuan,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      // Set loading state and reset errors
      isLoading(true);
      errorMessage('');
      reportData(null);

      // Execute the usecase
      final response = await createUmumUsecase.execute(
        id_user: idUser,
        dusun_lingkungan: dusunLingkungan,
        PKK_RW: pkkRw,
        desa_wisma: desaWisma,
        KRT: krt,
        KK: kk,
        jiwa_laki: jiwaLaki,
        jiwa_perempuan: jiwaPerempuan,
        anggota_laki: anggotaLaki,
        anggota_perempuan: anggotaPerempuan,
        umum_laki: umumLaki,
        umum_perempuan: umumPerempuan,
        khusus_laki: khususLaki,
        khusus_perempuan: khususPerempuan,
        honorer_laki: honorerLaki,
        honorer_perempuan: honorerPerempuan,
        bantuan_laki: bantuanLaki,
        bantuan_perempuan: bantuanPerempuan,
        id_role: idRole,
        id_organization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Umum berhasil disimpan',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      } else {
        errorMessage(response.message);
        Get.snackbar(
          'Gagal', 
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error', 
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  // // Clear form data
  // void resetForm() {
  //   reportData(null);
  //   errorMessage('');
  // }

  // // Convenience getter for the entry data
  // UmumEntry? get entryData => reportData.value?.data;
}