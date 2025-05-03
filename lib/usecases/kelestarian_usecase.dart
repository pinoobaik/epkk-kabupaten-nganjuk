import 'package:e_pkk_nganjuk/features/home/data/model/report_kelestarian_model.dart';
import 'package:e_pkk_nganjuk/repositories/kelestarian_repository.dart';

class KelestarianUsecase {
  final KelestarianRepository repository;

  KelestarianUsecase({required this.repository});

  Future<ReportKelestarianModel> submitKelestarianData({
    required String idUser,
    required String jamban,
    required String spal,
    required String tps,
    required String mck,
    required String pdam,
    required String sumur,
    required String lainnya,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.postKelestarianData(
      id_user: idUser,
      jamban: jamban,
      spal: spal,
      tps: tps,
      mck: mck,
      pdam: pdam,
      sumur: sumur,
      lainnya: lainnya,
      id_role: idRole,
      id_organization: idOrganization,
      catatan: catatan,
    );
  }
}