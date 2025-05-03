import 'package:e_pkk_nganjuk/features/home/data/model/report_kesehatan_model.dart';
import 'package:e_pkk_nganjuk/usecases/kesehatan_usecase.dart';
import 'package:get/get.dart';

class KesehatanController extends GetxController {
  final KesehatanUsecase kesehatanUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportKesehatanModel>();

  KesehatanController({required this.kesehatanUsecase});

  Future<void> submitKesehatanData({
    required String idUser,
    required String jumlahPosyandu,
    required String jumlahPosyanduIterasi,
    required String jumlahKip,
    required String jumlahAnggota,
    required String jumlahKartuGratis,
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
      final response = await kesehatanUsecase.submitKesehatanData(
        idUser: idUser,
        jumlahPosyandu: jumlahPosyandu,
        jumlahPosyanduIterasi: jumlahPosyanduIterasi,
        jumlahKip: jumlahKip,
        jumlahAnggota: jumlahAnggota,
        jumlahKartuGratis: jumlahKartuGratis,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Kesehatan berhasil disimpan',
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
  // KesehatanEntry? get entryData => reportData.value?.data;
}