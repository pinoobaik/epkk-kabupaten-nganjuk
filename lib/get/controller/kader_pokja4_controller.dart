import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja4_model.dart';
import 'package:e_pkk_nganjuk/usecases/kader_pokja4_usecase.dart';
import 'package:get/get.dart';

class KaderPokja4Controller extends GetxController {
  final SubmitKaderPokja4Usecase submitKaderPokja4Usecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportKaderPokja4Model>();

  KaderPokja4Controller({required this.submitKaderPokja4Usecase});

  Future<void> submitDataKaderPokja4({
    required String idUser,
    required String posyandu,
    required String gizi,
    required String kesling,
    required String penyuluhanNarkoba,
    required String phbs,
    required String kb,
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
      final response = await submitKaderPokja4Usecase.execute(
        idUser: idUser,
        posyandu: posyandu,
        gizi: gizi,
        kesling: kesling,
        penyuluhanNarkoba: penyuluhanNarkoba,
        phbs: phbs,
        kb: kb,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Kader Pokja 4 berhasil disimpan',
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
}