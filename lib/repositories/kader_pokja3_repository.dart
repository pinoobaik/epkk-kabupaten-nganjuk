import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja3_model.dart';
import '../services/api/api_helper.dart';

class KaderPokja3Repository {
  final ApiHelper apiHelper;

  KaderPokja3Repository({required this.apiHelper});

  Future<ReportKaderPokja3Model> submitKaderPokja3({
    required String idUser,
    required String pangan,
    required String sandang,
    required String tataLaksanaRumah,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/kader-pokja3/insert_kader_pokja3.php',
        data: {
          'id_user': idUser,
          'pangan': pangan,
          'sandang': sandang,
          'tata_laksana_rumah': tataLaksanaRumah,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportKaderPokja3Model.fromJson(body);
        } else {
          throw Exception('Format respons tidak valid');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server sedang bermasalah, silakan coba lagi nanti.');
      } else {
        throw Exception('Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      print('Error submitting kader pokja 3: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportKaderPokja3Model> getKaderPokja3(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/kader-pokja3/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja3Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching kader pokja 3: $e');
  //     throw Exception('Gagal mengambil data kader pokja 3');
  //   }
  // }

  // Future<ReportKaderPokja3Model> updateKaderPokja3({
  //   required String id,
  //   required String pangan,
  //   required String sandang,
  //   required String tataLaksanaRumah,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/kader-pokja3/update_data.php',
  //       data: {
  //         'id': id,
  //         'pangan': pangan,
  //         'sandang': sandang,
  //         'tata_laksana_rumah': tataLaksanaRumah,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja3Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating kader pokja 3: $e');
  //     throw Exception('Gagal mengupdate data');
  //   }
  // }

  // Future<bool> deleteKaderPokja3(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/kader-pokja3/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting kader pokja 3: $e');
  //     throw Exception('Gagal menghapus data');
  //   }
  // }
}