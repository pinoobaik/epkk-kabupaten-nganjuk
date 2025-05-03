import 'package:e_pkk_nganjuk/get/controller/kelestarian_controller.dart';
import 'package:e_pkk_nganjuk/repositories/kelestarian_repository.dart';
import 'package:e_pkk_nganjuk/usecases/kelestarian_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class KelestarianBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = KelestarianRepository(apiHelper: dioClient.apiHelper);
    
    final createReportKelestarian = KelestarianUsecase(repository: repository);

    Get.put(KelestarianController(
      kelestarianUsecase: createReportKelestarian ,
    ));
  }
}
