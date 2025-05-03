import 'package:e_pkk_nganjuk/get/controller/kader_pokja4_controller.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja4_repository.dart';
import 'package:e_pkk_nganjuk/usecases/kader_pokja4_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class KaderPokja4Binding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = KaderPokja4Repository(apiHelper: dioClient.apiHelper);
    
    final createReportKaderPokja4 = SubmitKaderPokja4Usecase(repository: repository);

    Get.put(KaderPokja4Controller(
      submitKaderPokja4Usecase: createReportKaderPokja4,
    ));
  }
}
