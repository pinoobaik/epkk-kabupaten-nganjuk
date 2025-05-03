import 'package:e_pkk_nganjuk/get/controller/gotong_royong_controller.dart';
import 'package:e_pkk_nganjuk/repositories/gotong_royong_repository.dart';
import 'package:e_pkk_nganjuk/usecases/gotong_royong_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class GotongRoyongBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = GotongRoyongRepository(apiHelper: dioClient.apiHelper);
    
    final createReportGotongRoyong = CreateGotongRoyongUsecase(repository: repository);

    Get.put(GotongRoyongController(
      createUsecase: createReportGotongRoyong,
    ));
  }
}
