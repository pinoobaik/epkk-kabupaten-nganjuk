import 'package:e_pkk_nganjuk/get/controller/kader_pokja1_controller.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja1_repository.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/usecases/kader_pokja1_usecase.dart';
import 'package:get/get.dart';

class UploadReportBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = UploadReportRepository(apiHelper: dioClient.apiHelper);
    
    final createReportKaderPokja1 = CreateKaderPokja1Usecase(repository: repository);

    Get.put(UploadReportController(
      createKaderPokja1Usecase: createReportKaderPokja1,
    ));
  }
}
