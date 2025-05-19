// features/profil/domain/usecases/profil_usecases.dart

import 'package:e_pkk_nganjuk/features/home/data/model/profil_model.dart';
import 'package:e_pkk_nganjuk/repositories/profil_repository.dart';

class GetProfilUsecase {
  final ProfilRepository repository;

  GetProfilUsecase({required this.repository});

  Future<ProfilResponse> execute(String userId) async { 
    try {
      final response = await repository.getProfil(userId);
      
      // Validasi tambahan
      if (response.data.isEmpty) {
        throw Exception('Profile data not found for ID: $userId');
      }
      
      return response;
    } catch (e) {
      print('Error in GetProfilUsecase: $e');
      rethrow;
    }
  }
}

class UpdateProfileInfoUsecase {
  final ProfilRepository repository;

  UpdateProfileInfoUsecase({required this.repository});

  Future<ProfilResponse> execute({
    required String id,
    required String fullName,
    required String phoneNumber,
  }) async {
    return await repository.updateProfileInfo(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
  }
}

class UpdatePasswordUsecase {
  final ProfilRepository repository;

  UpdatePasswordUsecase({required this.repository});

  Future<ProfilResponse> execute({
    required String id,
    required String currentPassword,
    required String newPassword,
  }) async {
    return await repository.updatePassword(
      id: id,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}

