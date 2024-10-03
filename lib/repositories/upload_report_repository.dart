// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja1_model.dart';
// import 'package:http/http.dart' as http;
//
// import '../services/api/api_helper.dart';
//
// class UploadReportRepository {
//   Future<ReportKaderPokja1Model> postKaderPokja1Repository({
//     required String PKBN,
//     required String PKDRT,
//     required String pola_asuh,
//     required String role,
//     required String role_bidang,
//     required String id_user,
//   }) async {
//     Uri url = Uri.parse(ApiHelper.url + 'kader-pokja1/insert_kader1.php');
//     try {
//       var response = await http.post(
//         url,
//         body: {
//           'PKBN': PKBN,
//           'PKDRT': PKDRT,
//           'pola_asuh': pola_asuh,
//           'role': role,
//           'role_bidang': role_bidang,
//           'id_user': id_user,
//         },
//       ).timeout(const Duration(seconds: 10)); // Tambahkan timeout
//
//       if (response.statusCode == 200) {
//         var body = json.decode(response.body);
//         print('Response body: $body');
//
//         if (body is Map<String, dynamic>) {
//           return ReportKaderPokja1Model.fromJson(body);
//         } else {
//           throw Exception('Format respons tidak valid');
//         }
//       } else if (response.statusCode == 500) {
//         throw Exception('Server sedang bermasalah, silakan coba lagi nanti.');
//       } else {
//         throw Exception(
//             'Terjadi kesalahan. Kode status: ${response.statusCode}');
//       }
//     } on SocketException {
//       // Tangani exception ketika tidak ada koneksi internet
//       throw Exception(
//           'Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
//     } on TimeoutException {
//       // Tangani exception ketika timeout terjadi
//       throw Exception('Server tidak merespons, coba lagi nanti.');
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Terjadi kesalahan saat menghubungi server.');
//     }
//   }
// }
