import 'dart:async';
import 'dart:io';

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

}
