import 'package:e_pkk_nganjuk/get/controller/perencanaan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/perencanaan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/perencanaan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class PerencanaanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PerencanaanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPerencanaan = CreatePerencanaanUsecase(repository: repository);

    Get.put(PerencanaanController(
      createPerencanaanUsecase: createReportPerencanaan ,
    ));
  }
}
