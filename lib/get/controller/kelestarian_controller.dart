import 'package:e_pkk_nganjuk/features/home/data/model/report_kelestarian_model.dart';
import 'package:e_pkk_nganjuk/usecases/kelestarian_usecase.dart';
import 'package:get/get.dart';

class KelestarianController extends GetxController {
  final KelestarianUsecase kelestarianUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportKelestarianModel>();

  KelestarianController({required this.kelestarianUsecase});

  Future<void> submitKelestarianData({
    required String idUser,
    required String jamban,
    required String spal,
    required String tps,
    required String mck,
    required String pdam,
    required String sumur,
    required String lainnya,
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
      final response = await kelestarianUsecase.submitKelestarianData(
        idUser: idUser,
        jamban: jamban,
        spal: spal,
        tps: tps,
        mck: mck,
        pdam: pdam,
        sumur: sumur,
        lainnya: lainnya,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Kelestarian Lingkungan berhasil disimpan',
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
  // KelestarianEntry? get entryData => reportData.value?.data;
}