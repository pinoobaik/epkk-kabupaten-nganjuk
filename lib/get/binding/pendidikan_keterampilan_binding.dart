import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/pendidikan_keterampilan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/pendidikan_keterampilan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class PendidikanKeterampilanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PendidikanKeterampilanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPendidikanKeterampilan = PendidikanKeterampilanUsecase(repository: repository);

    Get.put(PendidikanKeterampilanController(
      pendidikanKeterampilanUsecase: createReportPendidikanKeterampilan,
    ));
  }
}
