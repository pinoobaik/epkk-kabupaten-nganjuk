import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/services/api/api_helper.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';

class PengumumanRepository {
  final ApiHelper apiHelper;

  PengumumanRepository({required this.apiHelper});

  Future<PengumumanResponse> getPengumuman() async {
    try {
      final response = await apiHelper.get('/announcement/get_announcement.php');

      if (response.statusCode == 200) {
        final responseData = response.data;
        
        if (responseData is Map<String, dynamic>) {
          return PengumumanResponse.fromJson(responseData);
        } else {
          throw Exception('Format respons tidak valid: Data bukan JSON object');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server sedang bermasalah, silakan coba lagi nanti');
      } else {
        throw Exception('Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa koneksi Anda');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti');
    } catch (e) {
      print('Error getPengumuman: $e');
      throw Exception('Gagal memuat pengumuman: ${e.toString()}');
    }
  }
}