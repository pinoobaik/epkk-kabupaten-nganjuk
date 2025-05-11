import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_sandang_model.dart';
import '../services/api/api_helper.dart';

class SandangRepository {
  final ApiHelper apiHelper;

  SandangRepository({required this.apiHelper});

  Future<ReportSandangModel> submitDataSandang({
    required String idUser,
    required String pangan,
    required String sandang,
    required String jasa,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/sandang/insert_sandang.php',
        data: {
          'id_user': idUser,
          'pangan': pangan,
          'sandang': sandang,
          'jasa': jasa,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportSandangModel.fromJson(body);
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
      print('Error submitting data sandang: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportSandangModel> getDataSandang(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/sandang/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportSandangModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching data sandang: $e');
  //     throw Exception('Gagal mengambil data sandang');
  //   }
  // }

  // Future<ReportSandangModel> updateDataSandang({
  //   required String id,
  //   required String pangan,
  //   required String sandang,
  //   required String jasa,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/sandang/update_data.php',
  //       data: {
  //         'id': id,
  //         'pangan': pangan,
  //         'sandang': sandang,
  //         'jasa': jasa,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportSandangModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating data sandang: $e');
  //     throw Exception('Gagal mengupdate data sandang');
  //   }
  // }

  // Future<bool> deleteDataSandang(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/sandang/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting data sandang: $e');
  //     throw Exception('Gagal menghapus data sandang');
  //   }
  // }

  // Future<ReportSandangModel> searchDataSandang({
  //   String? keyword,
  //   String? statusFilter,
  //   DateTime? startDate,
  //   DateTime? endDate,
  // }) async {
  //   try {
  //     final params = {
  //       if (keyword != null) 'keyword': keyword,
  //       if (statusFilter != null) 'status': statusFilter,
  //       if (startDate != null) 'start_date': startDate.toIso8601String(),
  //       if (endDate != null) 'end_date': endDate.toIso8601String(),
  //     };

  //     final response = await apiHelper.get(
  //       '/report/sandang/search_data.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportSandangModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Pencarian gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error searching data sandang: $e');
  //     throw Exception('Gagal melakukan pencarian data sandang');
  //   }
  // }

  // Future<ReportSandangModel> getSandangByDateRange({
  //   required DateTime startDate,
  //   required DateTime endDate,
  // }) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/sandang/by_date_range.php',
  //       params: {
  //         'start_date': startDate.toIso8601String(),
  //         'end_date': endDate.toIso8601String(),
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportSandangModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching sandang by date range: $e');
  //     throw Exception('Gagal mengambil data berdasarkan rentang tanggal');
  //   }
  // }
}