import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_pendidikan_keterampilan_model.dart';
import '../services/api/api_helper.dart';

class PendidikanKeterampilanRepository {
  final ApiHelper apiHelper;

  PendidikanKeterampilanRepository({required this.apiHelper});

  Future<ReportPendidikanKeterampilanModel> createPendidikanKeterampilan({
    required String idUser,
    required String wargaButa,
    required String kelBelajarA,
    required String wargaBelajarA,
    required String kelBelajarB,
    required String wargaBelajarB,
    required String kelBelajarC,
    required String wargaBelajarC,
    required String kelBelajarKF,
    required String wargaBelajarKF,
    required String paud,
    required String tamanBacaan,
    required String jumlahKlp,
    required String jumlahLbuPeserta,
    required String jumlahApe,
    required String jumlahKelSimulasi,
    required String kf,
    required String paudTutor,
    required String bkb,
    required String koperasi,
    required String ketrampilan,
    required String lp3pkk,
    required String tp3pkk,
    required String damasPkk,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/pendidikan-keterampilan/submit_data.php',
        data: {
          'id_user': idUser,
          'warga_buta': wargaButa,
          'kel_belajarA': kelBelajarA,
          'warga_belajarA': wargaBelajarA,
          'kel_belajarB': kelBelajarB,
          'warga_belajarB': wargaBelajarB,
          'kel_belajarC': kelBelajarC,
          'warga_belajarC': wargaBelajarC,
          'kel_belajarKF': kelBelajarKF,
          'warga_belajarKF': wargaBelajarKF,
          'paud': paud,
          'taman_bacaan': tamanBacaan,
          'jumlah_klp': jumlahKlp,
          'jumlah_lbu_peserta': jumlahLbuPeserta,
          'jumlah_ape': jumlahApe,
          'jumlah_kel_simulasi': jumlahKelSimulasi,
          'KF': kf,
          'paud_tutor': paudTutor,
          'BKB': bkb,
          'koperasi': koperasi,
          'ketrampilan': ketrampilan,
          'LP3PKK': lp3pkk,
          'TP3PKK': tp3pkk,
          'damas_pkk': damasPkk,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ReportPendidikanKeterampilanModel.fromJson(body);
        } else {
          throw Exception('Invalid response format');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server error, please try again later');
      } else {
        throw Exception('Error occurred. Status code: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No internet connection. Please check your network.');
    } on TimeoutException {
      throw Exception('Server timeout, please try again later.');
    } catch (e) {
      print('Error submitting pendidikan keterampilan: $e');
      throw Exception('Failed to submit data: ${e.toString()}');
    }
  }

//   Future<ReportPendidikanKeterampilanModel> getPendidikanKeterampilanData(String id) async {
//     try {
//       final response = await apiHelper.get(
//         '/report/pendidikan-keterampilan/get_data.php',
//         params: {'id': id},
//       );

//       if (response.statusCode == 200) {
//         return ReportPendidikanKeterampilanModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load data. Status: ${response.statusCode}');
//       }
//     } on SocketException {
//       throw Exception('No internet connection');
//     } catch (e) {
//       print('Error fetching data: $e');
//       throw Exception('Failed to fetch pendidikan keterampilan data');
//     }
//   }

//   Future<ReportPendidikanKeterampilanModel> updatePendidikanKeterampilan({
//     required String id,
//     required String wargaButa,
//     // Include all other required fields...
//     String? catatan,
//   }) async {
//     try {
//       final response = await apiHelper.put(
//         '/report/pendidikan-keterampilan/update_data.php',
//         data: {
//           'id': id,
//           'warga_buta': wargaButa,
//           // Include all other fields...
//           if (catatan != null) 'catatan': catatan,
//         },
//       );

//       if (response.statusCode == 200) {
//         return ReportPendidikanKeterampilanModel.fromJson(response.data);
//       } else {
//         throw Exception('Update failed. Status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error updating: $e');
//       throw Exception('Failed to update data');
//     }
//   }
}