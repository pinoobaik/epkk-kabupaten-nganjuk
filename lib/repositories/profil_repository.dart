import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_pkk_nganjuk/services/api/api_helper.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/profil_model.dart';

class ProfilRepository {
  final ApiHelper apiHelper;

  ProfilRepository({required this.apiHelper});

  Future<ProfilResponse> getProfil(String userId) async {
  try {
    final response = await apiHelper.get(
      'home/profile/get_profil.php',
      queryParameters: {'id': userId},
    );

    // Debugging penting
    print('API Response: ${response.data}');

    if (response.data is! Map<String, dynamic>) {
      throw Exception('Invalid response format');
    }
      return ProfilResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load profile: ${e.message}');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa koneksi Anda');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti');
    } catch (e) {
      print('Error getProfil: $e');
      throw Exception('Gagal memuat profil: ${e.toString()}');
    }
 
  }

  Future<ProfilResponse> updateProfileInfo({
    required String id,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final payload = {
        'id': id,
        'full_name': fullName,
        'phone_number': phoneNumber,
      };

      final response = await apiHelper.post(
        '/home/profile/update_profil.php',
        data: {'profile_update': true, ...payload},
      );

      return _handleUpdateResponse(response);
    } on SocketException {
      throw Exception('Tidak ada koneksi internet');
    } on TimeoutException {
      throw Exception('Server tidak merespons');
    } catch (e) {
      throw Exception('Gagal update profil: ${e.toString()}');
    }
  }

  Future<ProfilResponse> updatePassword({
    required String id,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await apiHelper.post(
        '/home/profile/update_profil.php',
        data: {
          'password_update': true,
          'id': id,
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );

      return _handleUpdateResponse(response);
    } on SocketException {
      throw Exception('Tidak ada koneksi internet');
    } catch (e) {
      throw Exception('Gagal update password: ${e.toString()}');
    }
  }

  // -- Helper Methods -- //

  ProfilResponse _handleUpdateResponse(dynamic response) {
    if (response.statusCode == 200) {
      return ProfilResponse.fromJson(response.data);
    } else {
      throw _handleErrorResponse(response.statusCode, response.data);
    }
  }

  Exception _handleErrorResponse(int? statusCode, dynamic data) {
    String? errorMsg;
      if (data is Map<String, dynamic>) {
        final error = data['error'];
        if (error is Map<String, dynamic>) {
          errorMsg = error['message'] as String?;
        }
      }
          
    switch (statusCode) {
      case 400:
        return Exception(errorMsg ?? 'Permintaan tidak valid');
      case 401:
        return Exception(errorMsg ?? 'Tidak terotorisasi');
      case 404:
        return Exception(errorMsg ?? 'Data tidak ditemukan');
      case 500:
        return Exception(errorMsg ?? 'Server error');
      default:
        return Exception(errorMsg ?? 'Terjadi kesalahan (Code: $statusCode)');
    }
  }
}