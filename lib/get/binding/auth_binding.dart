import 'package:e_pkk_nganjuk/get/controller/auth_controller.dart';
import 'package:e_pkk_nganjuk/repositories/auth_repository.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/usecases/auth_usecase.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = AuthRepository(apiHelper: dioClient.apiHelper);

    final authLogin = AuthLoginUseCase(repository: repository);
    //final authRegister = AuthRegisterUseCase(repository: repository);

    Get.put(AuthController(
      authUseCase: authLogin,
      //authRegisterUseCase: authRegister,
    ));
  }
}
