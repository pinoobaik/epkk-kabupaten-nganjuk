import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_pengembangan_kehidupan_model.dart';
import '../services/api/api_helper.dart';

class PengembanganKehidupanRepository {
  final ApiHelper apiHelper;

  PengembanganKehidupanRepository({required this.apiHelper});

  Future<ReportPengembanganKehidupanModel> submitPengembanganKehidupan({
    required String idUser,
    required String jumlahKelompokPemula,
    required String jumlahPesertaPemula,
    required String jumlahKelompokMadya,
    required String jumlahPesertaMadya,
    required String jumlahKelompokUtama,
    required String jumlahPesertaUtama,
    required String jumlahKelompokMandiri,
    required String jumlahPesertaMandiri,
    required String jumlahKelompokHukum,
    required String jumlahPesertaHukum,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/pengembangan-kehidupan/insert_pengembangan_kehidupan.php',
        data: {
          'id_user': idUser,
          'jumlah_kelompok_pemula': jumlahKelompokPemula,
          'jumlah_peserta_pemula': jumlahPesertaPemula,
          'jumlah_kelompok_madya': jumlahKelompokMadya,
          'jumlah_peserta_madya': jumlahPesertaMadya,
          'jumlah_kelompok_utama': jumlahKelompokUtama,
          'jumlah_peserta_utama': jumlahPesertaUtama,
          'jumlah_kelompok_mandiri': jumlahKelompokMandiri,
          'jumlah_peserta_mandiri': jumlahPesertaMandiri,
          'jumlah_kelompok_hukum': jumlahKelompokHukum,
          'jumlah_peserta_hukum': jumlahPesertaHukum,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportPengembanganKehidupanModel.fromJson(body);
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
      print('Error submitting pengembangan kehidupan: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }

  // Future<ReportPengembanganKehidupanModel> getPengembanganKehidupan(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/pengembangan-kehidupan/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPengembanganKehidupanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Gagal memuat data. Status: ${response.statusCode}');
  //     }
  //   } on SocketException {
  //     throw Exception('Tidak ada koneksi internet');
  //   } catch (e) {
  //     print('Error fetching pengembangan kehidupan: $e');
  //     throw Exception('Gagal mengambil data pengembangan kehidupan');
  //   }
  // }

  // Future<ReportPengembanganKehidupanModel> updatePengembanganKehidupan({
  //   required String id,
  //   required String jumlahKelompokPemula,
  //   // Include all other fields...
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/pengembangan-kehidupan/update_data.php',
  //       data: {
  //         'id': id,
  //         'jumlah_kelompok_pemula': jumlahKelompokPemula,
  //         // Include all other fields...
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportPengembanganKehidupanModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Update gagal. Status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating pengembangan kehidupan: $e');
  //     throw Exception('Gagal mengupdate data');
  //   }
  // }

  // Future<bool> deletePengembanganKehidupan(String id) async {
  //   try {
  //     final response = await apiHelper.delete(
  //       '/report/pengembangan-kehidupan/delete_data.php',
  //       data: {'id': id},
  //     );

  //     return response.statusCode == 200;
  //   } catch (e) {
  //     print('Error deleting pengembangan kehidupan: $e');
  //     throw Exception('Gagal menghapus data');
  //   }
  // }
}