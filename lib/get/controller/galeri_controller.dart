
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

  // GaleriController
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
      isLoading(true);
      errorMessage('');
      galeriData(null);

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

      if (response.statusCode == 200) {
        galeriData(response);
      } else {
        errorMessage(response.message);
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan: ${e.toString().replaceAll('Exception: ', '')}');
    } finally {
      isLoading(false);
    }
  }

}