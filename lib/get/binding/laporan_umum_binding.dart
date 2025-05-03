import 'package:e_pkk_nganjuk/get/controller/laporan_umum_controller.dart';
import 'package:e_pkk_nganjuk/repositories/laporan_umum_repository.dart';
import 'package:e_pkk_nganjuk/usecases/laporan_umum_usecase.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:get/get.dart';

class LaporanUmumBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final repository = UmumRepository(apiHelper: dioClient.apiHelper);
    
    final createReportLaporanUmum = CreateUmumUsecase(repository: repository);

    Get.put(LaporanUmumController(
      createUmumUsecase: createReportLaporanUmum ,
    ));
  }
}
