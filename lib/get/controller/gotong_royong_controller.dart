import 'package:e_pkk_nganjuk/features/home/data/model/report_gotong_royong_model.dart';
import 'package:e_pkk_nganjuk/usecases/gotong_royong_usecase.dart';
import 'package:get/get.dart';

class GotongRoyongController extends GetxController {
  final CreateGotongRoyongUsecase createUsecase;

  // Reactive state variables
  var reportData = Rxn<ReportGotongRoyongModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  GotongRoyongController({required this.createUsecase});

  Future<void> submitGotongRoyong({
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
      // Reset state and set loading
      isLoading.value = true;
      errorMessage.value = '';
      reportData.value = null;

      // Execute usecase
      final response = await createUsecase.execute(
        idUser: idUser,
        kerjaBakti: kerjaBakti,
        rukunKematian: rukunKematian,
        keagamaan: keagamaan,
        jimpitan: jimpitan,
        arisan: arisan,
        idRole: idRole,
        idOrganization: idOrganization,
        catatan: catatan,
      );

      // Handle response
      if (response.statusCode == 200) {
        reportData.value = response;
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}