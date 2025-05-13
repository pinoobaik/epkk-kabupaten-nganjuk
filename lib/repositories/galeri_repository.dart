import 'dart:async';
import 'dart:io';
import 'package:e_pkk_nganjuk/features/home/data/model/galeri_model.dart';
import '../services/api/api_helper.dart';
import 'package:dio/dio.dart';

class GaleriRepository {
  final ApiHelper apiHelper;

  GaleriRepository({required this.apiHelper});

  // POST DATA GALERI
  Future<GaleriModel> submitDataGaleri({
    required String idUser,
    required String deskripsi,
    required String gambar,
    required String pokja,
    required String bidang,
    required String idRole,
    required String idOrganization,
    String? status,
  }) async {
    try {
        // Konversi file ke MultipartFile
      final file = await MultipartFile.fromFile(gambar);

      // Kirim sebagai multipart
      final response = await apiHelper.postMultipart(
        '/report/galeri/insert_galeri.php',
        data: {
          'id_user': idUser,
          'deskripsi': deskripsi,
          'gambar': file, // File dikirim sebagai MultipartFile
          'pokja': pokja,
          'bidang': bidang,
          'id_role': idRole,
          'id_organization': idOrganization,
          if (status != null) 'status': status,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return GaleriModel.fromJson(body);
        } else {
          throw Exception('Format respons tidak valid');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server sedang bermasalah, silakan coba lagi nanti.');
      } else {
        throw Exception('Terjadi kesalahan. Kode status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
    } on TimeoutException {
      throw Exception('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      print('Error submitting data galeri: $e');
      throw Exception('Terjadi kesalahan saat mengunggah galeri.');
    }
  }

  // GET DATA GALERI (Contoh stub)
  /*
  Future<GaleriModel> getDataGaleri(String id) async {
    try {
      final response = await apiHelper.get(
        '/galeri/get_data.php',
        params: {'id': id},
      );

      if (response.statusCode == 200) {
        return GaleriModel.fromJson(response.data);
      } else {
        throw Exception('Gagal memuat data. Status: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet');
    } catch (e) {
      print('Error fetching data galeri: $e');
      throw Exception('Gagal mengambil data galeri');
    }
  }
  */

  // UPDATE DATA GALERI (Contoh stub)
  /*
  Future<GaleriModel> updateDataGaleri({
    required String id,
    required String deskripsi,
    required String gambar,
    required String status,
  }) async {
    try {
      final response = await apiHelper.put(
        '/galeri/update_data.php',
        data: {
          'id': id,
          'deskripsi': deskripsi,
          'gambar': gambar,
          'status': status,
        },
      );

      if (response.statusCode == 200) {
        return GaleriModel.fromJson(response.data);
      } else {
        throw Exception('Update gagal. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating data galeri: $e');
      throw Exception('Gagal mengupdate data galeri');
    }
  }
  */

  // DELETE DATA GALERI (Contoh stub)
  /*
  Future<bool> deleteDataGaleri(String id) async {
    try {
      final response = await apiHelper.delete(
        '/galeri/delete_data.php',
        data: {'id': id},
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting data galeri: $e');
      throw Exception('Gagal menghapus data galeri');
    }
  }
  */
}