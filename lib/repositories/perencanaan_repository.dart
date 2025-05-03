import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_perencanaan_model.dart';
import '../services/api/api_helper.dart';

class PerencanaanRepository {
  final ApiHelper apiHelper;

  PerencanaanRepository({required this.apiHelper});

  Future<ReportPerencanaanModel> postPerencanaanData({
    required String id_user,
    required String jumlahPriaSubur,
    required String jumlahWanitaSubur,
    required String kbPria,
    required String kbWanita,
    required String kkTabungan,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/perencanaan/insert_perencanaan.php',
        data: {
          'id_user': id_user,
          'J_Psubur': jumlahPriaSubur,
          'J_Wsubur': jumlahWanitaSubur,
          'Kb_p': kbPria,
          'Kb_w': kbWanita,
          'Kk_tbg': kkTabungan,
          'id_role': id_role,
          'id_organization': id_organization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        var body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportPerencanaanModel.fromJson(body);
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

  // Future<ReportPerencanaanModel> getPerencanaanData(String idReport) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/perencanaan/get_perencanaan.php',
  //       params: {'id': idReport},
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportPerencanaanModel.fromJson(body);
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

  // Future<ReportPerencanaanModel> updatePerencanaanData({
  //   required String idReport,
  //   required String jumlahPriaSubur,
  //   required String jumlahWanitaSubur,
  //   required String kbPria,
  //   required String kbWanita,
  //   required String kkTabungan,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/perencanaan/update_perencanaan.php',
  //       data: {
  //         'id_pokja4_bidang3': idReport,
  //         'J_Psubur': jumlahPriaSubur,
  //         'J_Wsubur': jumlahWanitaSubur,
  //         'Kb_p': kbPria,
  //         'Kb_w': kbWanita,
  //         'Kk_tbg': kkTabungan,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportPerencanaanModel.fromJson(body);
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

  // Future<bool> deletePerencanaanData(String idReport) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/perencanaan/delete_perencanaan.php',
  //       data: {'id_pokja4_bidang3': idReport},
  //     );

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       throw Exception(
  //           'Gagal menghapus data. Kode status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Terjadi kesalahan saat menghapus data');
  //   }
  // }
}