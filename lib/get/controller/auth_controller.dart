import 'package:dio/dio.dart';
import 'package:e_pkk_nganjuk/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';

import '../../features/auth/data/model/auth_model.dart';
import '../../routes/app_routes.dart';
import '../../services/preferences/preferences_service.dart';

class AuthController extends GetxController {
  final AuthLoginUseCase authUseCase;
  final AuthRegisterUseCase authRegisterUseCase;

  var authResponse = Rxn<LoginResponse>();
  var isAuthLogin = false.obs;
  var authResponses = Rxn<RegisterResponse>();
  var isAuthRegister = false.obs;
  var errorMessage = ''.obs;

  AuthController({
    required this.authUseCase,
    required this.authRegisterUseCase,
  });

  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 3));

    final isExpired = await PreferencesService.isLoginExpired();
    if (isExpired) {
      await PreferencesService.clearUserData();
      Get.offAllNamed(Routes.WELCOME);
    } else {

      // ini buat matiin sesi nanti dihapus kalo udah selesai
      // await PreferencesService.clearUserData();
      // Get.offAllNamed(Routes.WELCOME);

      // ini kode buat aktifkan sesinya lagi ya gess
      final user = await PreferencesService.getUser();
      if (user != null) {
        Get.offAllNamed(Routes.MAIN, 
        //arguments: {'role': user.role}
        );
      } else {
        Get.offAllNamed(Routes.WELCOME);
      }
    }
  }

  Future<void> authLoginController({
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    isAuthLogin.value = true;
    errorMessage.value = '';

    try {
      final response = await authUseCase.execute(
        phoneNumber: phoneNumber,
        password: password,
        role: role,
      );

      authResponse.value = response;

      if (response.statusCode == 200 && response.data != null) {
        await PreferencesService.saveUser(response.data!);
        return;
      }

      errorMessage.value = response.message;
    } catch (e) {
      String errorDescription = 'Terjadi kesalahan saat mencoba login';

      if (e is DioException) {
        switch (e.response?.statusCode) {
          case 401:
            errorDescription = 'Password salah!. Silakan coba lagi.';
            break;
          case 403:
            errorDescription = 'Anda tidak memiliki akses ke halaman ini!. Silakan periksa kembali.';
            break;
          case 404:
            errorDescription = 'Nomor WhatsApp tidak terdaftar. Silakan mendaftar terlebih dahulu.';
            break;
          case 500:
            errorDescription = 'Terjadi kesalahan pada server. Silakan coba lagi nanti.';
            break;
          default:
            errorDescription = e.response?.data['message'] ?? 'Terjadi kesalahan koneksi internet';
        }
      } else {
        errorDescription = e.toString();
      }

      errorMessage.value = errorDescription;
    } finally {
      isAuthLogin.value = false;
    }
  }

  var passwordMismatch = false.obs;

  void checkPasswordMatch(String password, String confirmPassword) {
    passwordMismatch.value = password != confirmPassword;
  }

  Future<void> authRegisterController({
    required String full_name,
    required String phone_number,
    required String id_subdistrict,
    required String id_village,
    required String role_id,
    required String id_organization,
    required String kode_otp,
    required String password,
    // required String full_name,
    // required String phone_number,
    // required String kecamatan,
    // required String desa,
    // required String id_role,
    // required String roleBidang,
    // required String password,
    // required String kodeOtp,
    //required String status,
  }) async {
    isAuthRegister.value = true;
    errorMessage.value = '';
    try {
      final response = await authRegisterUseCase.execute(
        // nama_pengguna: nama_pengguna,
        // noWhatsapp: noWhatsapp,
        // kecamatan: kecamatan,
        // desa: desa,
        // role: role,
        // roleBidang: roleBidang,
        // password: password,
        // kodeOtp: kodeOtp,
        // status: status,
        full_name: full_name,
        phone_number: phone_number,
        id_subdistrict: id_subdistrict,
        id_village: id_village,
        role_id: role_id,
        id_organization: id_organization,
        password: password,
        kode_otp: kode_otp,
      );
      authResponses.value = response;
      if (response.statusCode == 200 ) {
        if (response.data != null) {
          await PreferencesService.saveUser(response.data!);
          return;
        }
        
      } else {
        errorMessage.value = response.message;
        Get.snackbar(
          'Gagal membuat akun',
          response.message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } finally {
      isAuthRegister.value = false;
    }
  }
}
