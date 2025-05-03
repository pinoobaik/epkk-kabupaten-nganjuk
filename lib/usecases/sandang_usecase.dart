import 'package:e_pkk_nganjuk/features/home/data/model/report_sandang_model.dart';
import 'package:e_pkk_nganjuk/repositories/sandang_repository.dart';

class SandangUsecase {
  final SandangRepository repository;

  SandangUsecase({required this.repository});

  Future<ReportSandangModel> submitDataSandang({
    required String idUser,
    required String pangan,
    required String sandang,
    required String jasa,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitDataSandang(
      idUser: idUser,
      pangan: pangan,
      sandang: sandang,
      jasa: jasa,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}