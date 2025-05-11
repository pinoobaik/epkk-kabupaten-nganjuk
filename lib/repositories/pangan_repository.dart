import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_pangan_model.dart';
import '../services/api/api_helper.dart';

class PanganRepository {
  final ApiHelper apiHelper;

  PanganRepository({required this.apiHelper});

  Future<ReportPanganModel> submitDataPangan({
    required String idUser,
    required String beras,
    required String nonBeras,
    required String peternakan,
    required String perikanan,
    required String warungHidup,
    required String lumbungHidup,
    required String toga,
    required String tanamanKeras,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/pangan/insert_pangan.php',
        data: {
          'id_user': idUser,
          'beras': beras,
          'non_beras': nonBeras,
          'peternakan': peternakan,
          'perikanan': perikanan,
          'warung_hidup': warungHidup,
          'lumbung_hidup': lumbungHidup,
          'toga': toga,
          'tanaman_keras': tanamanKeras,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportPanganModel.fromJson(body);
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
      print('Error submitting data pangan: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportPanganModel> getDataPangan(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/pangan/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPanganModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching data pangan: $e');
  //     throw Exception('Gagal mengambil data pangan');
  //   }
  // }

  // Future<ReportPanganModel> updateDataPangan({
  //   required String id,
  //   required String beras,
  //   required String nonBeras,
  //   required String peternakan,
  //   required String perikanan,
  //   required String warungHidup,
  //   required String lumbungHidup,
  //   required String toga,
  //   required String tanamanKeras,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/pangan/update_data.php',
  //       data: {
  //         'id': id,
  //         'beras': beras,
  //         'non_beras': nonBeras,
  //         'peternakan': peternakan,
  //         'perikanan': perikanan,
  //         'warung_hidup': warungHidup,
  //         'lumbung_hidup': lumbungHidup,
  //         'toga': toga,
  //         'tanaman_keras': tanamanKeras,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPanganModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating data pangan: $e');
  //     throw Exception('Gagal mengupdate data pangan');
  //   }
  // }

  // Future<bool> deleteDataPangan(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/pangan/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting data pangan: $e');
  //     throw Exception('Gagal menghapus data pangan');
  //   }
  // }

  // Future<ReportPanganModel> searchDataPangan({
  //   String? keyword,
  //   String? filterStatus,
  //   DateTime? startDate,
  //   DateTime? endDate,
  // }) async {
  //   try {
  //     final params = {
  //       if (keyword != null) 'keyword': keyword,
  //       if (filterStatus != null) 'status': filterStatus,
  //       if (startDate != null) 'start_date': startDate.toIso8601String(),
  //       if (endDate != null) 'end_date': endDate.toIso8601String(),
  //     };

  //     final response = await apiHelper.get(
  //       '/report/pangan/search_data.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPanganModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Pencarian gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error searching data pangan: $e');
  //     throw Exception('Gagal melakukan pencarian data pangan');
  //   }
  // }
}