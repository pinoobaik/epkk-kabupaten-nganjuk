import 'package:e_pkk_nganjuk/features/home/data/model/report_sandang_model.dart';
import 'package:e_pkk_nganjuk/usecases/sandang_usecase.dart';
import 'package:get/get.dart';

class SandangController extends GetxController {
  final SandangUsecase sandangUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportSandangModel>();

  SandangController({required this.sandangUsecase});

  Future<void> submitDataSandang({
    required String idUser,
    required String pangan,
    required String sandang,
    required String jasa,
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
      final response = await sandangUsecase.submitDataSandang(
        idUser: idUser,
        pangan: pangan,
        sandang: sandang,
        jasa: jasa,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Sandang berhasil disimpan',
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

  // Clear form data
  void resetForm() {
    reportData(null);
    errorMessage('');
  }

  // Convenience getter for the entry data
  SandangEntry? get entryData => reportData.value?.data;
}