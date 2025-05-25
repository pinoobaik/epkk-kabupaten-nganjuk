// features/home/presentation/bindings/riwayat_binding.dart

import 'package:e_pkk_nganjuk/get/controller/detail_laporan_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/riwayat_controller.dart';
import 'package:e_pkk_nganjuk/repositories/riwayat_repository.dart';
import 'package:e_pkk_nganjuk/services/api/dio_client.dart';
import 'package:e_pkk_nganjuk/usecases/detail_laporan_usecase.dart';
import 'package:e_pkk_nganjuk/usecases/riwayat_usecase.dart';
import 'package:get/get.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Inisialisasi DioClient
    final dioClient = DioClient();

    // 2. Buat repository dengan ApiHelper
    final repository = RiwayatRepository(apiHelper: dioClient.apiHelper);

    // 3. Buat usecase dari repository
    final getRiwayatUsecase = GetRiwayatUsecase(repository: repository);
    final getDetailLaporanUsecase = GetDetailLaporanUsecase(repository: repository);

    // 4. Register controller ke GetX
    Get.put<RiwayatController>(
      RiwayatController(getRiwayatUsecase: getRiwayatUsecase
      ),
    );

    Get.put<DetailLaporanController>(
      DetailLaporanController(
      getDetailLaporanUsecase: getDetailLaporanUsecase,
      ),
    );

    Get.lazyPut<GetDetailLaporanUsecase>(
      () => GetDetailLaporanUsecase(repository: repository),
    );

  }
}
