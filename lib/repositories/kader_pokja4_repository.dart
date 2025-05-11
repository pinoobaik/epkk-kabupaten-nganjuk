import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja4_model.dart';
import '../services/api/api_helper.dart';

class KaderPokja4Repository {
  final ApiHelper apiHelper;

  KaderPokja4Repository({required this.apiHelper});

  Future<ReportKaderPokja4Model> submitDataKaderPokja4({
    required String idUser,
    required String posyandu,
    required String gizi,
    required String kesling,
    required String penyuluhanNarkoba,
    required String phbs,
    required String kb,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/kader-pokja4/insert_kader_pokja4.php',
        data: {
          'id_user': idUser,
          'posyandu': posyandu,
          'gizi': gizi,
          'kesling': kesling,
          'penyuluhan_narkoba': penyuluhanNarkoba,
          'PHBS': phbs,
          'KB': kb,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportKaderPokja4Model.fromJson(body);
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
      print('Error submitting data kader pokja 4: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportKaderPokja4Model> getDataKaderPokja4(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/kader-pokja4/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja4Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching data kader pokja 4: $e');
  //     throw Exception('Gagal mengambil data kader pokja 4');
  //   }
  // }

  // Future<ReportKaderPokja4Model> updateDataKaderPokja4({
  //   required String id,
  //   required String posyandu,
  //   required String gizi,
  //   required String kesling,
  //   required String penyuluhanNarkoba,
  //   required String phbs,
  //   required String kb,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/kader-pokja4/update_data.php',
  //       data: {
  //         'id': id,
  //         'posyandu': posyandu,
  //         'gizi': gizi,
  //         'kesling': kesling,
  //         'penyuluhan_narkoba': penyuluhanNarkoba,
  //         'PHBS': phbs,
  //         'KB': kb,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja4Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating data kader pokja 4: $e');
  //     throw Exception('Gagal mengupdate data kader pokja 4');
  //   }
  // }

  // Future<bool> deleteDataKaderPokja4(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/kader-pokja4/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting data kader pokja 4: $e');
  //     throw Exception('Gagal menghapus data kader pokja 4');
  //   }
  // }

  // Future<ReportKaderPokja4Model> getStatistikKesehatan({
  //   String? wilayah,
  //   DateTime? startDate,
  //   DateTime? endDate,
  // }) async {
  //   try {
  //     final params = {
  //       if (wilayah != null) 'wilayah': wilayah,
  //       if (startDate != null) 'start_date': startDate.toIso8601String(),
  //       if (endDate != null) 'end_date': endDate.toIso8601String(),
  //     };

  //     final response = await apiHelper.get(
  //       '/report/kader-pokja4/statistik.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja4Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat statistik. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching statistik kesehatan: $e');
  //     throw Exception('Gagal mengambil statistik kesehatan');
  //   }
  // }

  // Future<ReportKaderPokja4Model> searchKaderPokja4({
  //   String? keyword,
  //   String? statusFilter,
  //   String? programFilter,
  // }) async {
  //   try {
  //     final params = {
  //       if (keyword != null) 'keyword': keyword,
  //       if (statusFilter != null) 'status': statusFilter,
  //       if (programFilter != null) 'program': programFilter,
  //     };

  //     final response = await apiHelper.get(
  //       '/report/kader-pokja4/search.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportKaderPokja4Model.fromJson(response.data);
  //     } else {
  //       throw Exception('Pencarian gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error searching kader pokja 4: $e');
  //     throw Exception('Gagal melakukan pencarian data kader pokja 4');
  //   }
  // }
}