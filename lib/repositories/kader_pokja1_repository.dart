import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja1_model.dart';
import '../services/api/api_helper.dart';

class UploadReportRepository {
  final ApiHelper apiHelper;

  UploadReportRepository({required this.apiHelper});

  Future<ReportKaderPokja1Model> postKaderPokja1Repository({
    required String id_user,
    required String PKBN,
    required String PKDRT,
    required String pola_asuh,
    required String id_role,
    required String id_organization,
    
  }) async {
    
    try {
      final response = await apiHelper.post(
        '/report/kader-pokja1/insert_kader1.php',
        data: {
          'id_user': id_user,
          'PKBN': PKBN,
          'PKDRT': PKDRT,
          'pola_asuh': pola_asuh,
          'id_role': id_role,
          'id_organization': id_organization,
        }
      );

      if (response.statusCode == 200) {
        var body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportKaderPokja1Model.fromJson(body);
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
      // Tangani exception ketika tidak ada koneksi internet
      throw Exception(
          'Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
    } on TimeoutException {
      // Tangani exception ketika timeout terjadi
      throw Exception('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      print('Error: $e');
      throw Exception('Terjadi kesalahan saat menghubungi server.');
    }
  }
}
