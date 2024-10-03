// import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja1_model.dart';
// import 'package:e_pkk_nganjuk/usecases/upload_report_usecase.dart';
// import 'package:get/get.dart';
//
// class UploadReportController extends GetxController {
//   final CreateKaderPokja1Usecase createKaderPokja1Usecase;
//
//   var reportKaderPokja1Model = Rxn<ReportKaderPokja1Model>();
//   var isCreateKaderPokja1 = false.obs;
//   var errorMessage = ''.obs;
//
//   UploadReportController({required this.createKaderPokja1Usecase});
//
//   Future<void> createKaderPokja1Controller({
//     required String PKBN,
//     required String PKDRT,
//     required String pola_asuh,
//     required String role,
//     required String role_bidang,
//     required String id_user,
//   }) async {
//     isCreateKaderPokja1.value = true;
//     errorMessage.value = '';
//     try {
//       ReportKaderPokja1Model response = await createKaderPokja1Usecase.execute(
//         PKBN: PKBN,
//         PKDRT: PKDRT,
//         pola_asuh: pola_asuh,
//         role: role,
//         role_bidang: role_bidang,
//         id_user: id_user,
//       );
//
//       if (response.kode == 1) {
//         reportKaderPokja1Model.value = response;
//         print('Success Create Report: ${response.message}');
//       } else {
//         errorMessage.value = response.message;
//         print('Controller error: ${errorMessage.value}');
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//       print('Exception: $e');
//     } finally {
//       isCreateKaderPokja1.value = false;
//     }
//   }
// }
