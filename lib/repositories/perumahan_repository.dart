import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_perumahan_model.dart';
import '../services/api/api_helper.dart';

class PerumahanRepository {
  final ApiHelper apiHelper;

  PerumahanRepository({required this.apiHelper});

  Future<ReportPerumahanModel> submitDataPerumahan({
    required String idUser,
    required String layakHuni,
    required String tidakLayak,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/perumahan/insert_data.php',
        data: {
          'id_user': idUser,
          'layak_huni': layakHuni,
          'tidak_layak': tidakLayak,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportPerumahanModel.fromJson(body);
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
      print('Error submitting data perumahan: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportPerumahanModel> getDataPerumahan(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/perumahan/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPerumahanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching data perumahan: $e');
  //     throw Exception('Gagal mengambil data perumahan');
  //   }
  // }

  // Future<ReportPerumahanModel> updateDataPerumahan({
  //   required String id,
  //   required String layakHuni,
  //   required String tidakLayak,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/perumahan/update_data.php',
  //       data: {
  //         'id': id,
  //         'layak_huni': layakHuni,
  //         'tidak_layak': tidakLayak,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPerumahanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating data perumahan: $e');
  //     throw Exception('Gagal mengupdate data perumahan');
  //   }
  // }

  // Future<bool> deleteDataPerumahan(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/perumahan/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting data perumahan: $e');
  //     throw Exception('Gagal menghapus data perumahan');
  //   }
  // }

  // Future<ReportPerumahanModel> getStatistikPerumahan({
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
  //       '/report/perumahan/statistik.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPerumahanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat statistik. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching statistik perumahan: $e');
  //     throw Exception('Gagal mengambil statistik perumahan');
  //   }
  // }

  // Future<ReportPerumahanModel> searchPerumahan({
  //   String? keyword,
  //   String? statusFilter,
  //   String? wilayah,
  // }) async {
  //   try {
  //     final params = {
  //       if (keyword != null) 'keyword': keyword,
  //       if (statusFilter != null) 'status': statusFilter,
  //       if (wilayah != null) 'wilayah': wilayah,
  //     };

  //     final response = await apiHelper.get(
  //       '/report/perumahan/search.php',
  //       params: params,
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPerumahanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Pencarian gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error searching perumahan: $e');
  //     throw Exception('Gagal melakukan pencarian data perumahan');
  //   }
  // }
}