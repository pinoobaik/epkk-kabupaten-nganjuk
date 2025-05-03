import 'package:e_pkk_nganjuk/get/controller/sandang_controller.dart';
import 'package:e_pkk_nganjuk/repositories/sandang_repository.dart';
import 'package:e_pkk_nganjuk/usecases/sandang_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class SandangBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = SandangRepository(apiHelper: dioClient.apiHelper);
    
    final createReportSandang = SandangUsecase(repository: repository);

    Get.put(SandangController(
      sandangUsecase: createReportSandang,
    ));
  }
}
