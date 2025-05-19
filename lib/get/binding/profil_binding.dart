import 'package:e_pkk_nganjuk/get/controller/profil_controller.dart';
import 'package:e_pkk_nganjuk/repositories/profil_repository.dart';
import 'package:e_pkk_nganjuk/usecases/profil_usecase.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';

class ProfilBinding implements Bindings {
  @override
  void dependencies() {
    // 1. Initialize Dio Client
    final dioClient = DioClient();
    
    // 2. Setup Repository dengan ApiHelper dari DioClient
    final repository = ProfilRepository(
      apiHelper: dioClient.apiHelper,
    );

    // 3. Setup UseCases dengan Repository
    final getProfilUsecase = GetProfilUsecase(repository: repository);
    final updateProfileInfoUsecase = UpdateProfileInfoUsecase(repository: repository);
    final updatePasswordUsecase = UpdatePasswordUsecase(repository: repository);

    // 4. Register Controller dengan UseCases
    Get.lazyPut<ProfilController>(
      () => ProfilController(
        getProfilUsecase: getProfilUsecase,
        updateProfileInfoUsecase: updateProfileInfoUsecase,
        updatePasswordUsecase: updatePasswordUsecase,
      ),
      fenix: true, // Untuk recreate controller jika diperlukan
    );
  }
}