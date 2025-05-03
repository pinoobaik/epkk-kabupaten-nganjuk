import 'package:e_pkk_nganjuk/features/home/data/model/report_penghayatan_pengamalan_model.dart';
import 'package:e_pkk_nganjuk/usecases/penghayatan_pengamalan_usecase.dart';
import 'package:get/get.dart';

class PenghayatanPengamalanController extends GetxController {
  final CreatePenghayatanPengamalanUsecase createUsecase;

  // Reactive state variables
  var reportData = Rxn<ReportPenghayatanPengamalanModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  PenghayatanPengamalanController({required this.createUsecase});

  Future<void> submitPenghayatanPengamalan({
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
      // Reset state and set loading
      isLoading.value = true;
      errorMessage.value = '';
      reportData.value = null;

      // Execute usecase
      final response = await createUsecase.execute(
        idUser: idUser,
        jumlahKelSimulasi1: jumlahKelSimulasi1,
        jumlahAnggota1: jumlahAnggota1,
        jumlahKelSimulasi2: jumlahKelSimulasi2,
        jumlahAnggota2: jumlahAnggota2,
        jumlahKelSimulasi3: jumlahKelSimulasi3,
        jumlahAnggota3: jumlahAnggota3,
        jumlahKelSimulasi4: jumlahKelSimulasi4,
        jumlahAnggota4: jumlahAnggota4,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData.value = response;
        Get.snackbar('Sukses', 'Data berhasil disimpan');
      } else {
        errorMessage.value = response.message;
        Get.snackbar('Error', errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', 'Terjadi kesalahan: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  // Clear form data
  void clearForm() {
    reportData.value = null;
    errorMessage.value = '';
  }
}