import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_laporan_umum_model.dart';
import '../services/api/api_helper.dart';

class UmumRepository {
  final ApiHelper apiHelper;

  UmumRepository({required this.apiHelper});

  Future<ReportUmumModel> postUmumData({
    required String id_user,
    required String dusun_lingkungan,
    required String PKK_RW,
    required String desa_wisma,
    required String KRT,
    required String KK,
    required String jiwa_laki,
    required String jiwa_perempuan,
    required String anggota_laki,
    required String anggota_perempuan,
    required String umum_laki,
    required String umum_perempuan,
    required String khusus_laki,
    required String khusus_perempuan,
    required String honorer_laki,
    required String honorer_perempuan,
    required String bantuan_laki,
    required String bantuan_perempuan,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/umum/insert_umum.php',
        data: {
          'id_user': id_user,
          'dusun_lingkungan': dusun_lingkungan,
          'PKK_RW': PKK_RW,
          'desa_wisma': desa_wisma,
          'KRT': KRT,
          'KK': KK,
          'jiwa_laki': jiwa_laki,
          'jiwa_perempuan': jiwa_perempuan,
          'anggota_laki': anggota_laki,
          'anggota_perempuan': anggota_perempuan,
          'umum_laki': umum_laki,
          'umum_perempuan': umum_perempuan,
          'khusus_laki': khusus_laki,
          'khusus_perempuan': khusus_perempuan,
          'honorer_laki': honorer_laki,
          'honorer_perempuan': honorer_perempuan,
          'bantuan_laki': bantuan_laki,
          'bantuan_perempuan': bantuan_perempuan,
          'id_role': id_role,
          'id_organization': id_organization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        var body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportUmumModel.fromJson(body);
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

  // Future<ReportUmumModel> getUmumData(String idReport) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/umum/get_umum.php',
  //       params: {'id': idReport},
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportUmumModel.fromJson(body);
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

  // Future<ReportUmumModel> updateUmumData({
  //   required String idReport,
  //   required String dusun_lingkungan,
  //   required String PKK_RW,
  //   required String desa_wisma,
  //   required String KRT,
  //   required String KK,
  //   required String jiwa_laki,
  //   required String jiwa_perempuan,
  //   required String anggota_laki,
  //   required String anggota_perempuan,
  //   required String umum_laki,
  //   required String umum_perempuan,
  //   required String khusus_laki,
  //   required String khusus_perempuan,
  //   required String honorer_laki,
  //   required String honorer_perempuan,
  //   required String bantuan_laki,
  //   required String bantuan_perempuan,
  //   String? catatan,
  // }) async {
  //   try {
  //     final response = await apiHelper.put(
  //       '/report/umum/update_umum.php',
  //       data: {
  //         'id_laporan_umum': idReport,
  //         'dusun_lingkungan': dusun_lingkungan,
  //         'PKK_RW': PKK_RW,
  //         'desa_wisma': desa_wisma,
  //         'KRT': KRT,
  //         'KK': KK,
  //         'jiwa_laki': jiwa_laki,
  //         'jiwa_perempuan': jiwa_perempuan,
  //         'anggota_laki': anggota_laki,
  //         'anggota_perempuan': anggota_perempuan,
  //         'umum_laki': umum_laki,
  //         'umum_perempuan': umum_perempuan,
  //         'khusus_laki': khusus_laki,
  //         'khusus_perempuan': khusus_perempuan,
  //         'honorer_laki': honorer_laki,
  //         'honorer_perempuan': honorer_perempuan,
  //         'bantuan_laki': bantuan_laki,
  //         'bantuan_perempuan': bantuan_perempuan,
  //         if (catatan != null) 'catatan': catatan,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var body = response.data;
  //       if (body is Map<String, dynamic>) {
  //         return ReportUmumModel.fromJson(body);
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