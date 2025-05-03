import 'package:e_pkk_nganjuk/get/controller/perumahan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/perumahan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/perumahan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class PerumahanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PerumahanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPerumahan = PerumahanUsecase(repository: repository);

    Get.put(PerumahanController(
      perumahanUsecase: createReportPerumahan,
    ));
  }
}
