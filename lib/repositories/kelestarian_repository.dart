import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_kelestarian_model.dart';
import '../services/api/api_helper.dart';

class KelestarianRepository {
  final ApiHelper apiHelper;

  KelestarianRepository({required this.apiHelper});

  Future<ReportKelestarianModel> postKelestarianData({
    required String id_user,
    required String jamban,
    required String spal,
    required String tps,
    required String mck,
    required String pdam,
    required String sumur,
    required String lainnya,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/kelestarian/insert_kelestarian.php',
        data: {
          'id_user': id_user,
          'jamban': jamban,
          'spal': spal,
          'tps': tps,
          'mck': mck,
          'pdam': pdam,
          'sumur': sumur,
          'dll': lainnya,
          'id_role': id_role,
          'id_organization': id_organization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        var body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportKelestarianModel.fromJson(body);
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

  // Future<ReportKelestarianModel> getKelestarianData(String idReport) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/kelestarian/get_kelestarian.php',
  //       params: {'id': idReport},
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportKelestarianModel.fromJson(body);
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

  // Future<ReportKelestarianModel> updateKelestarianData({
  //   required String idReport,
  //   required String jamban,
  //   required String spal,
  //   required String tps,
  //   required String mck,
  //   required String pdam,
  //   required String sumur,
  //   required String lainnya,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/kelestarian/update_kelestarian.php',
  //       data: {
  //         'id_pokja4_bidang2': idReport,
  //         'jamban': jamban,
  //         'spal': spal,
  //         'tps': tps,
  //         'mck': mck,
  //         'pdam': pdam,
  //         'sumur': sumur,
  //         'dll': lainnya,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportKelestarianModel.fromJson(body);
  //       } else {
  //         throw Exception('Format respons tidak valid');
  //       }
  //     } else {
  //       throw Exception(
  //           'Gagal memperbarui data. Kode status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Terjadi kesalahan saat memperbarui data');
  //   }
  // }
}