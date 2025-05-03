import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_kesehatan_model.dart';
import '../services/api/api_helper.dart';

class KesehatanRepository {
  final ApiHelper apiHelper;

  KesehatanRepository({required this.apiHelper});

  Future<ReportKesehatanModel> postKesehatanData({
    required String id_user,
    required String jumlah_posyandu,
    required String jumlah_posyandu_iterasi,
    required String jumlah_kip,
    required String jumlah_anggota,
    required String jumlah_kartu_gratis,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/kesehatan/insert_kesehatan.php',
        data: {
          'id_user': id_user,
          'jumlah_posyandu': jumlah_posyandu,
          'jumlah_posyandu_iterasi': jumlah_posyandu_iterasi,
          'jumlah_kip': jumlah_kip,
          'jumlah_anggota': jumlah_anggota,
          'jumlah_kartu_gratis': jumlah_kartu_gratis,
          'id_role': id_role,
          'id_organization': id_organization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        var body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportKesehatanModel.fromJson(body);
        } else {
          throw Exception('Format respons tidak valid');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server sedang bermasalah, silakan coba lagi nanti.');
      } else {
        throw Exception(
            'Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception(
          'Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      print('Error: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

 
  // Future<ReportKesehatanModel> getKesehatanData(String idReport) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/kesehatan/get_kesehatan.php',
  //       params: {'id': idReport},
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportKesehatanModel.fromJson(body);
  //       } else {
  //         throw Exception('Format respons tidak valid');
  //       }
  //     } else {
  //       throw Exception(
  //           'Terjadi kesalahan. Kode status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Terjadi kesalahan saat mengambil data');
  //   }
  // }
}