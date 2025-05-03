import 'package:e_pkk_nganjuk/features/home/data/model/report_pendidikan_keterampilan_model.dart';
import 'package:e_pkk_nganjuk/usecases/pendidikan_keterampilan_usecase.dart';
import 'package:get/get.dart';

class PendidikanKeterampilanController extends GetxController {
  final PendidikanKeterampilanUsecase pendidikanKeterampilanUsecase;

  // Reactive state
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reportData = Rxn<ReportPendidikanKeterampilanModel>();

  PendidikanKeterampilanController({required this.pendidikanKeterampilanUsecase});

  Future<void> submitPendidikanKeterampilan({
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
      isLoading(true);
      errorMessage('');
      reportData(null);

      final response = await pendidikanKeterampilanUsecase.execute(
        idUser: idUser,
        wargaButa: wargaButa,
        kelBelajarA: kelBelajarA,
        wargaBelajarA: wargaBelajarA,
        kelBelajarB: kelBelajarB,
        wargaBelajarB: wargaBelajarB,
        kelBelajarC: kelBelajarC,
        wargaBelajarC: wargaBelajarC,
        kelBelajarKF: kelBelajarKF,
        wargaBelajarKF: wargaBelajarKF,
        paud: paud,
        tamanBacaan: tamanBacaan,
        jumlahKlp: jumlahKlp,
        jumlahLbuPeserta: jumlahLbuPeserta,
        jumlahApe: jumlahApe,
        jumlahKelSimulasi: jumlahKelSimulasi,
        kf: kf,
        paudTutor: paudTutor,
        bkb: bkb,
        koperasi: koperasi,
        ketrampilan: ketrampilan,
        lp3pkk: lp3pkk,
        tp3pkk: tp3pkk,
        damasPkk: damasPkk,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      if (response.statusCode == 200) {
        reportData(response);
        Get.snackbar(
          'Berhasil', 
          'Data Pendidikan & Keterampilan berhasil disimpan',
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

  // void resetForm() {
  //   reportData(null);
  //   errorMessage('');
  // }

  // // Helper getter
  // PendidikanKeterampilanEntry? get entryData => reportData.value?.data;
}