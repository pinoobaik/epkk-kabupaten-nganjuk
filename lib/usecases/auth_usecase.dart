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
    required String nama_pengguna,
    required String noWhatsapp,
    required String kecamatan,
    required String desa,
    required String role,
    required String roleBidang,
    required String password,
    required String kodeOtp,
    required String status,
  }) async {
    return await repository.postRegisterAuthRepository(
      nama_pengguna: nama_pengguna,
      noWhatsapp: noWhatsapp,
      kecamatan: kecamatan,
      desa: desa,
      role: role,
      roleBidang: roleBidang,
      kodeOtp: kodeOtp,
      password: password,
      status: status,
    );
  }
}
