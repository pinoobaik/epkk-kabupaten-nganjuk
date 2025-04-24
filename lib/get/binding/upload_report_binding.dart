import 'package:e_pkk_nganjuk/get/controller/upload_report_controller.dart';
import 'package:e_pkk_nganjuk/repositories/upload_report_repository.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/usecases/upload_report_usecase.dart';
import 'package:get/get.dart';

class UploadReportBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = UploadReportRepository(apiHelper: dioClient.apiHelper);
    
    final createReportKaderPokja1 =
        CreateKaderPokja1Usecase(repository: repository);

    Get.put(UploadReportController(
      createKaderPokja1Usecase: createReportKaderPokja1,
    ));
  }
}
