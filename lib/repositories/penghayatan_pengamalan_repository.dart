import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_penghayatan_pengamalan_model.dart';
import '../services/api/api_helper.dart';

class PenghayatanPengamalanRepository {
  final ApiHelper apiHelper;

  PenghayatanPengamalanRepository({required this.apiHelper});

  Future<ReportPenghayatanPengamalanModel> postPenghayatanPengamalan({
    required String idUser,
    required String jumlahKelSimulasi1,
    required String jumlahAnggota1,
    required String jumlahKelSimulasi2,
    required String jumlahAnggota2,
    required String jumlahKelSimulasi3,
    required String jumlahAnggota3,
    required String jumlahKelSimulasi4,
    required String jumlahAnggota4,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/penghayatan-pengamalan/insert_data.php',
        data: {
          'id_user': idUser,
          'jumlah_kel_simulasi1': jumlahKelSimulasi1,
          'jumlah_anggota1': jumlahAnggota1,
          'jumlah_kel_simulasi2': jumlahKelSimulasi2,
          'jumlah_anggota2': jumlahAnggota2,
          'jumlah_kel_simulasi3': jumlahKelSimulasi3,
          'jumlah_anggota3': jumlahAnggota3,
          'jumlah_kel_simulasi4': jumlahKelSimulasi4,
          'jumlah_anggota4': jumlahAnggota4,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportPenghayatanPengamalanModel.fromJson(body);
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
}