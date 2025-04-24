import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja1_model.dart';
import 'package:e_pkk_nganjuk/repositories/upload_report_repository.dart';

class CreateKaderPokja1Usecase {
  final UploadReportRepository repository;

  CreateKaderPokja1Usecase({required this.repository});

  Future<ReportKaderPokja1Model> execute({
    required String PKBN,
    required String PKDRT,
    required String pola_asuh,
    required String role,
    required String role_bidang,
    required String id_user,
  }) async {
    return await repository.postKaderPokja1Repository(
      PKBN: PKBN,
      PKDRT: PKDRT,
      pola_asuh: pola_asuh,
      role: role,
      role_bidang: role_bidang,
      id_user: id_user,
    );
  }
}
