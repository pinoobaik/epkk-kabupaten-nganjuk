import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/repositories/galeri_repository.dart';
import 'package:e_pkk_nganjuk/usecases/galeri_usecase.dart';
import 'package:e_pkk_nganjuk/get/controller/galeri_controller.dart';
import 'package:get/get.dart';

class GaleriBinding extends Bindings {
  @override
  void dependencies() {
    // Inisialisasi dependency chain
    final dioClient = DioClient();
    final repository = GaleriRepository(apiHelper: dioClient.apiHelper);
    final submitUsecase = SubmitGaleriUsecase(repository: repository);

    // Registrasi controller ke GetX
    Get.put(
      GaleriController(
        submitGaleriUsecase: submitUsecase,
      ),
      //permanent: true, // Opsional: untuk menjaga instance tetap aktif
    );
  }
}