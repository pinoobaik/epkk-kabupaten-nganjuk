
import 'package:e_pkk_nganjuk/features/home/data/model/galeri_model.dart';
import 'package:e_pkk_nganjuk/usecases/galeri_usecase.dart';
import 'package:get/get.dart';

class GaleriController extends GetxController {
  final SubmitGaleriUsecase submitGaleriUsecase;

  // State variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var galeriData = Rxn<GaleriModel>();

  GaleriController({required this.submitGaleriUsecase});

  Future<void> submitDataGaleri({
    required String idUser,
    required String deskripsi,
    required String gambar,
    required String pokja,
    required String bidang,
    required String idRole,
    required String idOrganization,
    String? status,
  }) async {
    try {
      // Reset state dan mulai loading
      isLoading(true);
      errorMessage('');
      galeriData(null);

      // Eksekusi usecase
      final response = await submitGaleriUsecase.execute(
        idUser: idUser,
        deskripsi: deskripsi,
        gambar: gambar,
        pokja: pokja,
        bidang: bidang,
        idRole: idRole,
        idOrganization: idOrganization,
        status: status,
      );

      // Handle response
      if (response.statusCode == 200) {
        galeriData(response);
        Get.snackbar(
          'Sukses',
          'Data galeri berhasil disimpan',
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
        'Terjadi kesalahan: ${e.toString().replaceAll('Exception: ', '')}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }
}