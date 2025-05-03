import 'package:e_pkk_nganjuk/get/controller/kesehatan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/kesehatan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/kesehatan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class KesehatanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = KesehatanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportKesehatan = KesehatanUsecase(repository: repository);

    Get.put(KesehatanController(
      kesehatanUsecase: createReportKesehatan,
    ));
  }
}
