import 'dart:math';

import 'package:dio/dio.dart';
import 'package:e_pkk_nganjuk/repositories/auth_repository.dart';
import 'package:e_pkk_nganjuk/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/data/model/auth_model.dart';
import '../../routes/app_routes.dart';
import '../../services/preferences/preferences_service.dart';

class AuthController extends GetxController {
  final AuthLoginUseCase authUseCase;
  final AuthRegisterUseCase authRegisterUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final AuthRepository authRepo = Get.find<AuthRepository>();

  var isForgotPasswordLoading = false.obs;
  var authResponse = Rxn<LoginResponse>();
  var isAuthLogin = false.obs;
  var authResponses = Rxn<RegisterResponse>();
  var isAuthRegister = false.obs;
  var errorMessage = ''.obs;
  String generatedOtp = '1000';

  AuthController({
    required this.authUseCase,
    required this.authRegisterUseCase,
    required this.forgotPasswordUseCase,
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
  }) async {
    isAuthRegister.value = true;
    errorMessage.value = '';
    try {
      final response = await authRegisterUseCase.execute(
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

  Future<void> verifyPhoneForPasswordReset(String phone) async {
    try {
      isForgotPasswordLoading.value = true;
      final response = await forgotPasswordUseCase.verifyPhone(phone);
      if (response.statusCode == 200) {
        Get.toNamed(Routes.VERIFICATION_FORGOT_PASSWORD, arguments: {
          'phone': phone,
        });
      } else {
        Get.snackbar('Error', response.message);
      }
    } finally {
      isForgotPasswordLoading.value = false;
    }
  }

  Future<void> resetPassword({
  required String phone,
  required String newPassword,
  }) async {
    try {
      isForgotPasswordLoading.value = true;
      errorMessage.value = '';

      print('Sending reset password with:');
      print('Phone: "$phone"');
      print('New Password: "$newPassword"');

      final response = await forgotPasswordUseCase.resetPassword(
        phone: phone,
        newPassword: newPassword,
      );

      if (response.statusCode == 200) {
        // Tambahan: pastikan response tidak ada error tersembunyi
        if (response.errorMessage != null && response.errorMessage!.isNotEmpty) {
          errorMessage.value = response.errorMessage!;
        } else {
          errorMessage.value = '';
          await PreferencesService.clearUserData();
          Get.offAllNamed(Routes.WELCOME);
        }
      } else {
        errorMessage.value = response.errorMessage ?? response.message;
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isForgotPasswordLoading.value = false;
    }
  }



  Future<void> sendOtpViaWhatsApp(String phoneNumber, String otp) async {
    try {
      await authRepo.sendOtpToWhatsApp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
    } catch (e) {
      throw Exception('Error dari AuthRepository: $e');
    }
  }

  // AuthController
  // Future<void> resendOTP(String phone) async {
  //   try {
  //     isForgotPasswordLoading.value = true;
  //     await forgotPasswordUseCase.verifyPhone(phone);
  //     Get.snackbar(
  //       'Berhasil',
  //       'Kode OTP baru telah dikirim',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isForgotPasswordLoading.value = false;
  //   }
  // }

  Future<void> resendOTP(String phone) async {
    try {
      isForgotPasswordLoading.value = true;

      // Generate OTP baru
      generateRandomNumber(); // Ini akan update `randomNumber`

      // Kirim OTP ke WhatsApp
      await sendOtpViaWhatsApp(phone, generatedOtp);

      Get.snackbar(
        'Berhasil',
        'Kode OTP baru telah dikirim ke WhatsApp',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Gagal mengirim ulang OTP: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isForgotPasswordLoading.value = false;
    }
  }

  Future<void> resendOtpForRegister({
    required String phoneNumber,
  }) async {
    try {
      isForgotPasswordLoading.value = true;
      generateRandomNumber();
      await sendOtpViaWhatsApp(phoneNumber, generatedOtp);
      Get.snackbar(
        'Kode Dikirim',
        'Kode OTP baru telah dikirim ke nomor WhatsApp Anda',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengirim ulang OTP: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isForgotPasswordLoading.value = false;
    }
  }



  Future<void> logout() async {
    await PreferencesService.clearUserData();
    Get.offAllNamed(Routes.WELCOME); 
  }

  void generateRandomNumber() {
    Random random = Random();
    generatedOtp = (random.nextInt(9000) + 1000).toString();
    print('Generated OTP: $generatedOtp');
  }

}



