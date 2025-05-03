import 'package:e_pkk_nganjuk/get/controller/pengembangan_kehidupan_controller.dart';
import 'package:e_pkk_nganjuk/repositories/pengembangan_kehidupan_repository.dart';
import 'package:e_pkk_nganjuk/usecases/pengembangan_kehidupan_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class PengembanganKehidupanBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = PengembanganKehidupanRepository(apiHelper: dioClient.apiHelper);
    
    final createReportPengembanganKehidupan = PengembanganKehidupanUsecase(repository: repository);

    Get.put(PengembanganKehidupanController(
      pengembanganKehidupanUsecase: createReportPengembanganKehidupan,
    ));
  }
}
