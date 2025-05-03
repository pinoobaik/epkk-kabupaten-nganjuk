import 'package:e_pkk_nganjuk/get/controller/penghayatan_pengamalan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/penghayatan_pengamalan_repository.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/usecases/penghayatan_pengamalan_usecase.dart';
import 'package:get/get.dart';

class PenghayatanPengamalanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PenghayatanPengamalanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPenghayatanPengamalan = CreatePenghayatanPengamalanUsecase(repository: repository);

    Get.put(PenghayatanPengamalanController(
      createUsecase: createReportPenghayatanPengamalan,
    ));
  }
}
