import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/features/home/data/model/detail_laporan_model.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/riwayat_model.dart';
import 'package:e_pkk_nganjuk/services/api/api_helper.dart';

class RiwayatRepository {
  final ApiHelper apiHelper;

  RiwayatRepository({required this.apiHelper});

  Future<RiwayatResponse> getRiwayat({
  required String idUser,
  required String idRole,
  required String idOrganization,
  }) async {
    try {
      final response = await apiHelper.get(
        '/home/riwayat/get_report.php',
        queryParameters: {
          'id_user': idUser,
          'id_role': idRole,
          'id_organization': idOrganization,
        },
      );
      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          return RiwayatResponse.fromJson(responseData);
        } else {
          throw Exception('Format respons tidak valid: Data bukan JSON object');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server sedang bermasalah, silakan coba lagi nanti.');
      } else {
        throw Exception(
            'Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa koneksi Anda.');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      print('Error getRiwayat: $e');
      throw Exception('Gagal memuat riwayat laporan: ${e.toString()}');
    }
  }

  Future<DetailLaporanResponse> getDetailLaporan({
    required String uuid,
    required int orgId,
  }) async {
    try {
      final response = await apiHelper.get(
        '/home/riwayat/get_detail_report.php',
        queryParameters: {
          'uuid': uuid,
          'org_id': orgId.toString(),
        },
      );

      if (response.statusCode == 200) {
        return DetailLaporanResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load detail: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updateLaporan({
    required String uuid,
    required int orgId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiHelper.post(
        '/home/riwayat/update_report.php',
        data: {
          'uuid': uuid,
          'org_id': orgId,
          'data': data,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Gagal update: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('Error update: $e');
    }
  }

  Future<void> cancelLaporan({
    required String uuid,
    required int orgId,
  }) async {
    try {
      final response = await apiHelper.post(
        '/home/riwayat/cancel_report.php',
        data: {
          'uuid': uuid,
          'org_id': orgId,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to cancel report');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}


