import 'package:e_pkk_nganjuk/features/home/data/model/detail_laporan_model.dart';
import 'package:e_pkk_nganjuk/repositories/riwayat_repository.dart';

class GetDetailLaporanUsecase {
  final RiwayatRepository repository;

  GetDetailLaporanUsecase({required this.repository});

  Future<DetailLaporanResponse> execute({
    required String uuid,
    required int orgId,
  }) async {
    return await repository.getDetailLaporan(
      uuid: uuid,
      orgId: orgId,
    );
  }
}