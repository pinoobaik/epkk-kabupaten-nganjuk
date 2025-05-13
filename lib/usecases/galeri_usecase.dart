
import 'package:e_pkk_nganjuk/features/home/data/model/galeri_model.dart';
import 'package:e_pkk_nganjuk/repositories/galeri_repository.dart';

class SubmitGaleriUsecase {
  final GaleriRepository repository;

  SubmitGaleriUsecase({required this.repository});

  Future<GaleriModel> execute({
    required String idUser,
    required String deskripsi,
    required String gambar,
    required String pokja,
    required String bidang,
    required String idRole,
    required String idOrganization,
    String? status,
  }) async {
    return await repository.submitDataGaleri(
      idUser: idUser,
      deskripsi: deskripsi,
      gambar: gambar,
      pokja: pokja,
      bidang: bidang,
      idRole: idRole,
      idOrganization: idOrganization,
      status: status,
    );
  }
}