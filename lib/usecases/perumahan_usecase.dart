import 'package:e_pkk_nganjuk/features/home/data/model/report_perumahan_model.dart';
import 'package:e_pkk_nganjuk/repositories/perumahan_repository.dart';

class PerumahanUsecase {
  final PerumahanRepository repository;

  PerumahanUsecase({required this.repository});

  Future<ReportPerumahanModel> submitDataPerumahan({
    required String idUser,
    required String layakHuni,
    required String tidakLayak,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitDataPerumahan(
      idUser: idUser,
      layakHuni: layakHuni,
      tidakLayak: tidakLayak,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}