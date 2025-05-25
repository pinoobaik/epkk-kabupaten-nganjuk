import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/services/api/api_helper.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';
import 'package:flutter/material.dart';

// pengumuman_repository.dart
class PengumumanRepository {
  final ApiHelper apiHelper;

  PengumumanRepository({required this.apiHelper});

  Future<PengumumanResponse> getPengumuman({int page = 1, int limit = 10}) async {
    try {
      final response = await apiHelper.get(
        '/announcement/get_announcement.php',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          return PengumumanResponse.fromJson(responseData);
        } else {
          throw Exception('Format respons tidak valid: ${response.data.runtimeType}');
        }
      } else {
        throw Exception('Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error in getPengumuman: $e');
      rethrow;
    }
  }
}