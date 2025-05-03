import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja1_model.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja1_repository.dart';

class CreateKaderPokja1Usecase {
  final UploadReportRepository repository;

  CreateKaderPokja1Usecase({required this.repository});

  Future<ReportKaderPokja1Model> execute({
    required String id_user,
    required String PKBN,
    required String PKDRT,
    required String pola_asuh,
    required String id_role,
    required String id_organization
  }) async {
    return await repository.postKaderPokja1Repository(
      id_user: id_user,
      PKBN: PKBN,
      PKDRT: PKDRT,
      pola_asuh: pola_asuh,
      id_role: id_role,
      id_organization: id_organization,
    );
  }
}
