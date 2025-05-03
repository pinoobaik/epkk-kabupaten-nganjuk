import 'package:e_pkk_nganjuk/features/home/data/model/report_perencanaan_model.dart';
import 'package:e_pkk_nganjuk/usecases/perencanaan_usecase.dart';
import 'package:get/get.dart';

class PerencanaanController extends GetxController {
  final CreatePerencanaanUsecase createPerencanaanUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportPerencanaanModel>();

  PerencanaanController({required this.createPerencanaanUsecase});

  Future<void> submitPerencanaanData({
    required String idUser,
    required String jumlahPriaSubur,
    required String jumlahWanitaSubur,
    required String kbPria,
    required String kbWanita,
    required String kkTabungan,
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
      final response = await createPerencanaanUsecase.execute(
        id_user: idUser,
        jumlahPriaSubur: jumlahPriaSubur,
        jumlahWanitaSubur: jumlahWanitaSubur,
        kbPria: kbPria,
        kbWanita: kbWanita,
        kkTabungan: kkTabungan,
        id_role: idRole,
        id_organization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Perencanaan berhasil disimpan',
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
  // PerencanaanEntry? get entryData => reportData.value?.data;
}