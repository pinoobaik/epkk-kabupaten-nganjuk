import 'package:e_pkk_nganjuk/features/welcome/model/role_user_model.dart';
import 'package:e_pkk_nganjuk/repositories/welcome_repository.dart';

class GetRoleUserUsecase {
  final WelcomeRepository repository;

  GetRoleUserUsecase({required this.repository});

  Future<RoleUserResponse?> execute(String id) async {
    try {
      final response = await repository.getRoleUser(id);
      print("Balance Use Cae ID: $id");

      if (response.data.isEmpty) {
        print('data role null: ${response.data}');
        return null;
      }
      return response;
    } catch (e) {
      print("Welcome Use Case Error: $e");
      rethrow;
    }
  }
}
