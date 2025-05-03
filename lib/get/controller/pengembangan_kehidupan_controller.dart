import 'package:e_pkk_nganjuk/features/home/data/model/report_pengembangan_kehidupan_model.dart';
import 'package:e_pkk_nganjuk/usecases/pengembangan_kehidupan_usecase.dart';
import 'package:get/get.dart';

class PengembanganKehidupanController extends GetxController {
  final PengembanganKehidupanUsecase pengembanganKehidupanUsecase;

  // Reactive state variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportPengembanganKehidupanModel>();

  PengembanganKehidupanController({required this.pengembanganKehidupanUsecase});

  Future<void> submitPengembanganKehidupan({
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
      // Set loading state and reset errors
      isLoading(true);
      errorMessage('');
      reportData(null);

      // Execute the usecase
      final response = await pengembanganKehidupanUsecase.execute(
        idUser: idUser,
        jumlahKelompokPemula: jumlahKelompokPemula,
        jumlahPesertaPemula: jumlahPesertaPemula,
        jumlahKelompokMadya: jumlahKelompokMadya,
        jumlahPesertaMadya: jumlahPesertaMadya,
        jumlahKelompokUtama: jumlahKelompokUtama,
        jumlahPesertaUtama: jumlahPesertaUtama,
        jumlahKelompokMandiri: jumlahKelompokMandiri,
        jumlahPesertaMandiri: jumlahPesertaMandiri,
        jumlahKelompokHukum: jumlahKelompokHukum,
        jumlahPesertaHukum: jumlahPesertaHukum,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Pengembangan Kehidupan berhasil disimpan',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      } else {
        errorMessage(response.message);
        Get.snackbar(
          'Gagal', 
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error', 
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  // Clear form data
  // void resetForm() {
  //   reportData(null);
  //   errorMessage('');
  // }

  // // Convenience getter for the entry data
  // PengembanganKehidupanEntry? get entryData => reportData.value?.data;
}