import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

import '../../repositories/welcome_repository.dart';
import '../../usecases/welcome_usecase.dart';
import '../controller/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = WelcomeRepository(apiHelper: dioClient.apiHelper);

    final getRoleUserUsecase = GetRoleUserUsecase(repository: repository);

    Get.put(WelcomeController(
      getRoleUserUsecase: getRoleUserUsecase,
    ));
  }
}
