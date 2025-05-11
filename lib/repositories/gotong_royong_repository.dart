import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/report_gotong_royong_model.dart';
import '../services/api/api_helper.dart';

class GotongRoyongRepository {
  final ApiHelper apiHelper;

  GotongRoyongRepository({required this.apiHelper});

  Future<ReportGotongRoyongModel> postGotongRoyongData({
    required String idUser,
    required String kerjaBakti,
    required String rukunKematian,
    required String keagamaan,
    required String jimpitan,
    required String arisan,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    try {
      final response = await apiHelper.post(
        '/report/gotong-royong/insert_gotong_royong.php',
        data: {
          'id_user': idUser,
          'kerja_bakti': kerjaBakti,
          'rukun_kematian': rukunKematian,
          'keagamaan': keagamaan,
          'jimpitan': jimpitan,
          'arisan': arisan,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (catatan != null) 'catatan': catatan,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        print('Response body: $body');

        if (body is Map<String, dynamic>) {
          return ReportGotongRoyongModel.fromJson(body);
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
      print('Error: $e');
      throw Exception('Failed to connect to server');
    }
  }

  // Future<ReportGotongRoyongModel> getGotongRoyongData(String id) async {
  //   try {
  //     final response = await apiHelper.get(
  //       '/report/gotong-royong/get_data.php',
  //       params: {'id': id},
  //     );

  //     if (response.statusCode == 200) {
  //       return ReportGotongRoyongModel.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Failed to fetch data');
  //   }
  // }
}