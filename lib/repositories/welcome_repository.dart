import 'package:e_pkk_nganjuk/services/api/api_helper.dart';

import '../features/welcome/model/role_user_model.dart';

class WelcomeRepository {
  final ApiHelper apiHelper;

  WelcomeRepository({required this.apiHelper});

  Future<RoleUserResponse> getRoleUser(String id) async {
    final response = await apiHelper.get('/auth/get_role.php?id=$id');

    if (response.statusCode == 200) {
      final responseData = response.data;

      if (responseData != null) {
        return RoleUserResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to Role User');
      }
    } else {
      throw Exception('Failed fetch: ${response.statusCode}');
    }
  }
}
