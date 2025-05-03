import 'package:e_pkk_nganjuk/features/home/data/model/report_perumahan_model.dart';
import 'package:e_pkk_nganjuk/usecases/perumahan_usecase.dart';
import 'package:get/get.dart';

class PerumahanController extends GetxController {
  final PerumahanUsecase perumahanUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportPerumahanModel>();

  PerumahanController({required this.perumahanUsecase});

  Future<void> submitDataPerumahan({
    required String idUser,
    required String layakHuni,
    required String tidakLayak,
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
      final response = await perumahanUsecase.submitDataPerumahan(
        idUser: idUser,
        layakHuni: layakHuni,
        tidakLayak: tidakLayak,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Perumahan berhasil disimpan',
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
  // PerumahanEntry? get entryData => reportData.value?.data;
}