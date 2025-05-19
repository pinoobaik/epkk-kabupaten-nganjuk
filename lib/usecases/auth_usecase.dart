import 'package:e_pkk_nganjuk/repositories/auth_repository.dart';

import '../features/auth/data/model/auth_model.dart';

class AuthLoginUseCase {
  final AuthRepository repository;

  AuthLoginUseCase({required this.repository});

  Future<LoginResponse> execute({
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    return await repository.postLoginAuthRepository(
      phoneNumber: phoneNumber,
      password: password,
      role: role,
    );
  }
}

class AuthRegisterUseCase {
  final AuthRepository repository;

  AuthRegisterUseCase({required this.repository});

  Future<RegisterResponse> execute({
    required String full_name,
    required String phone_number,
    required String id_subdistrict,
    required String id_village,
    required String role_id,
    required String id_organization,
    required String password,
    required String kode_otp,
    // required String status,
  }) async {
    return await repository.postRegisterAuthRepository(
      full_name : full_name,
      phone_number : phone_number,
      id_subdistrict : id_subdistrict,
      id_village : id_village,
      role_id : role_id,
      id_organization: id_organization,
      kode_otp : kode_otp,
      password : password,
      // status: status,
    );
  }
}

// auth_usecase.dart
class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<ForgotPasswordResponse> verifyPhone(String phone) async {
    return await repository.verifyPhoneNumber(phone);
  }

  Future<ForgotPasswordResponse> resetPassword({
    required String phone,
    required String newPassword,
    
  }) async {
    return await repository.resetPassword(
      phone: phone,
      newPassword: newPassword,
      
    );
  }
}
