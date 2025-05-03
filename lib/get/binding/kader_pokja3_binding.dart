import 'package:e_pkk_nganjuk/get/controller/kader_pokja3_controller.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja3_repository.dart';
import 'package:e_pkk_nganjuk/usecases/kader_pokja3_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class KaderPokja3Binding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = KaderPokja3Repository(apiHelper: dioClient.apiHelper);
    
    final createReportKaderPokja3 = KaderPokja3Usecase(repository: repository);

    Get.put(KaderPokja3Controller(
      kaderPokja3Usecase: createReportKaderPokja3,
    ));
  }
}
