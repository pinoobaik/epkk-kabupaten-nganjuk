import 'package:e_pkk_nganjuk/get/controller/pangan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/pangan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/pangan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class PanganBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PanganRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPangan = PanganUsecase(repository: repository);

    Get.put(PanganController(
      panganUsecase: createReportPangan,
    ));
  }
}
