import 'package:e_pkk_nganjuk/features/home/data/model/report_pangan_model.dart';
import 'package:e_pkk_nganjuk/usecases/pangan_usecase.dart';
import 'package:get/get.dart';

class PanganController extends GetxController {
  final PanganUsecase panganUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportPanganModel>();

  PanganController({required this.panganUsecase});

  Future<void> submitDataPangan({
    required String idUser,
    required String beras,
    required String nonBeras,
    required String peternakan,
    required String perikanan,
    required String warungHidup,
    required String lumbungHidup,
    required String toga,
    required String tanamanKeras,
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
      final response = await panganUsecase.submitDataPangan(
        idUser: idUser,
        beras: beras,
        nonBeras: nonBeras,
        peternakan: peternakan,
        perikanan: perikanan,
        warungHidup: warungHidup,
        lumbungHidup: lumbungHidup,
        toga: toga,
        tanamanKeras: tanamanKeras,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Pangan berhasil disimpan',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      } else {
        errorMessage(response.message);
        Get.snackbar(
          'Gagal', 
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error', 
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
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
  // PanganEntry? get entryData => reportData.value?.data;
}