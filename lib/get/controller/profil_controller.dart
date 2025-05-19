import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/features/home/data/model/profil_model.dart';
import 'package:e_pkk_nganjuk/get/controller/auth_controller.dart';
import 'package:e_pkk_nganjuk/services/preferences/preferences_service.dart';
import 'package:e_pkk_nganjuk/usecases/profil_usecase.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  final GetProfilUsecase getProfilUsecase;
  final UpdateProfileInfoUsecase updateProfileInfoUsecase;
  final UpdatePasswordUsecase updatePasswordUsecase;
  final AuthController authController = Get.find<AuthController>(); 
  
  // Observables
  final profilData = Profil(
    id: '0',
    uuid: '',
    phoneNumber: '',
    fullName: '',
    password: '',
    kodeOtp: '',
    status: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    idSubdistrict: '0',
    idVillage: '0',
    idRole: '0',
    idOrganization: '0',
  ).obs;
  
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final isUpdating = false.obs;
  final updateSuccess = false.obs;

  ProfilController({
    required this.getProfilUsecase,
    required this.updateProfileInfoUsecase,
    required this.updatePasswordUsecase,
  });

  @override
  void onInit() {
    super.onInit();
    loadProfil();
  }

   Future<void> loadProfil() async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      // Dapatkan user dari AuthController
      final user = await PreferencesService.getUser();
      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await getProfilUsecase.execute(user.id); // Gunakan ID user yang login
      
      if (response.data.isNotEmpty) {
        profilData.value = response.data.first;
      } else {
        throw Exception('Profile data empty');
      }
    } on SocketException {
      errorMessage.value = 'No internet connection';
    } catch (e) {
      errorMessage.value = 'Failed to load profile: ${e.toString()}';
      print('Error details: $e');
      
      // Auto logout jika token expired
      if (e.toString().contains('unauthorized')) {
        authController.logout();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> updateProfileInfo({
    required String fullName,
    required String phoneNumber,
  }) async {
    isUpdating.value = true;
    errorMessage.value = '';
    
    try {
      final response = await updateProfileInfoUsecase.execute(
        id: profilData.value.id,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );
      
      if (response.statusCode == 200) {
        profilData.update((val) {
          fullName = fullName;
          phoneNumber = phoneNumber;
          var updatedAt = DateTime.now();
        });
        Get.snackbar('Berhasil', 'Profil diperbarui', duration: 1.seconds);
        return true;
      } else {
        _handleErrorResponse(response);
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Gagal update: ${e.toString()}';
      return false;
    } finally {
      isUpdating.value = false;
    }
  }

  Future<bool> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    isUpdating.value = true;
    errorMessage.value = '';
    
    try {
      final response = await updatePasswordUsecase.execute(
        id: profilData.value.id,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      
      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Password diperbarui', duration: 1.seconds);
        return true;
      } else {
        _handleErrorResponse(response);
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Gagal update password: ${e.toString()}';
      return false;
    } finally {
      isUpdating.value = false;
    }
  }

  void _handleErrorResponse(ProfilResponse response) {
    final serverMessage = response.error?.message;
    errorMessage.value = serverMessage ?? response.message ?? 'Terjadi kesalahan';
    
    if (serverMessage != null) {
      Get.snackbar('Error', serverMessage, duration: 2.seconds);
    }
  }

  // Helper methods
  void resetErrorMessage() => errorMessage.value = '';
}