import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja3_model.dart';
import 'package:e_pkk_nganjuk/usecases/kader_pokja3_usecase.dart';
import 'package:get/get.dart';

class KaderPokja3Controller extends GetxController {
  final KaderPokja3Usecase kaderPokja3Usecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportKaderPokja3Model>();

  KaderPokja3Controller({required this.kaderPokja3Usecase});

  Future<void> submitKaderPokja3({
    required String idUser,
    required String pangan,
    required String sandang,
    required String tataLaksanaRumah,
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
      final response = await kaderPokja3Usecase.execute(
        idUser: idUser,
        pangan: pangan,
        sandang: sandang,
        tataLaksanaRumah: tataLaksanaRumah,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Kader Pokja 3 berhasil disimpan',
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
  // KaderPokja3Entry? get entryData => reportData.value?.data;
}