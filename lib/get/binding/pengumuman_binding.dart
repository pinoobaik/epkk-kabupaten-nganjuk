import 'package:e_pkk_nganjuk/get/controller/pengumuman_controller.dart';
import 'package:e_pkk_nganjuk/repositories/pengumuman_repository.dart';
import 'package:e_pkk_nganjuk/usecases/pengumuman_usecase.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';

class PengumumanBinding implements Bindings {
  @override
  void dependencies() {
    // 1. Initialize Dio Client
    final dioClient = DioClient();
    
    // 2. Setup Repository dengan ApiHelper dari DioClient
    final repository = PengumumanRepository(
      apiHelper: dioClient.apiHelper,
    );

    // 3. Setup UseCase dengan Repository
    final getPengumumanUsecase = GetPengumumanUsecase(
      repository: repository,
    );

    // 4. Register Controller dengan UseCase
    Get.put<PengumumanController>(
      PengumumanController(
        getPengumumanUsecase: getPengumumanUsecase,
      ),
      permanent: true, // Opsional: Untuk menjaga instance tetap aktif
    );
  }
}