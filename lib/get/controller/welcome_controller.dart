import 'package:e_pkk_nganjuk/features/welcome/model/role_user_model.dart';
import 'package:e_pkk_nganjuk/usecases/welcome_usecase.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final GetRoleUserUsecase getRoleUserUsecase;
  var getRoleUser = Rxn<RoleUserResponse>();
  var isGetRole = false.obs;
  var roleName = ''.obs;
  var roleID = ''.obs;
  var errorMessage = ''.obs;

  WelcomeController({required this.getRoleUserUsecase});

  Future<void> getRoleUserController(String id) async {
    isGetRole.value = true;
    errorMessage.value = '';

    try {
      final response = await getRoleUserUsecase.execute(id);

      if (response != null && response.data.isNotEmpty) {
        roleID.value = response.data.first.id;
        roleName.value = response.data.first.name;
      } else {
        getRoleUser.value = response;
        errorMessage.value = response!.message;
        print('Error: ${errorMessage.value}');
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch role';
      print('Error in controller: $e');
    } finally {
      isGetRole.value = false;
    }
  }
}
