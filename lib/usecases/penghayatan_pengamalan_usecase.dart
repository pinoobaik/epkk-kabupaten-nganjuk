import 'package:e_pkk_nganjuk/features/home/data/model/report_penghayatan_pengamalan_model.dart';
import 'package:e_pkk_nganjuk/repositories/penghayatan_pengamalan_repository.dart';

class CreatePenghayatanPengamalanUsecase {
  final PenghayatanPengamalanRepository repository;

  CreatePenghayatanPengamalanUsecase({required this.repository});

  Future<ReportPenghayatanPengamalanModel> execute({
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
    return await repository.postPenghayatanPengamalan(
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
  }
}