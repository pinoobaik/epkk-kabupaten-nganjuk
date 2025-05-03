import 'package:e_pkk_nganjuk/services/api/api_helper.dart';

import '../features/auth/data/model/auth_model.dart';

class AuthRepository {
  final ApiHelper apiHelper;

  AuthRepository({required this.apiHelper});

  Future<LoginResponse> postLoginAuthRepository({
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    try {
      final response = await apiHelper.post('/auth/login.php', 
      data: {
        'phone_number': phoneNumber,
        'password': password,
        'role': role,
      });

      // Cek apakah respons 200 OK dan ada data
      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data;
        return LoginResponse.fromJson(responseData);
      }

      // Tangani status code selain 200 (misalnya 401, 404)
      if (response.statusCode == 401) {
        throw Exception('Incorrect password');
      } else if (response.statusCode == 404) {
        throw Exception('Phone number not registered');
      } else if (response.statusCode == 403) {
        throw Exception('Invalid role');
      } else {
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    } catch (e) {
      // Lanjutkan exception ke controller
      rethrow;
    }
  }

  //coba 3
  Future<RegisterResponse> postRegisterAuthRepository({
    required String full_name,
    required String phone_number,
    required String id_subdistrict,
    required String id_village,
    required String role_id,
    required String id_organization,
    required String kode_otp,
    required String password,
    // required String status,
    }) async {
      try {
        final response = await apiHelper.post('/auth/register.php', data: {
          'full_name': full_name,
          'phone_number': phone_number,
          'id_subdistrict': id_subdistrict,
          'id_village': id_village,
          'id_role': role_id,
          'id_organization': id_organization,
          'password': password,
          'kode_otp': kode_otp,
          // 'status': status,
        });

        if (response.statusCode == 200 && response.data != null) {
          final responseData = response.data;
          return RegisterResponse.fromJson(responseData);
        } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
      } catch (e) {
        rethrow;
      }
    }
}

  // coba 2
  // Future<RegisterResponse> postRegisterAuthRepository({
  //   required String nama_pengguna,
  //   required String noWhatsapp,
  //   required String kecamatan,
  //   required String desa,
  //   required String role,
  //   required String roleBidang,
  //   required String kodeOtp,
  //   required String password,
  //   required String status,
  // }) async {
  //   try {
  //     final response = await apiHelper.post('/auth/register.php', data: {
  //       'nama_pengguna': nama_pengguna,
  //       'no_whatsapp': noWhatsapp,
  //       'kecamatan': kecamatan,
  //       'desa': desa,
  //       'role': role,
  //       'role_bidang': roleBidang,
  //       'password': password,
  //       'kode_otp': kodeOtp,
  //       'status': status,
  //     });

  //     if (response.statusCode == 200 && response.data != null) {
  //       final responseData = response.data;
  //       return RegisterResponse.fromJson(responseData);
  //     } else {
  //     throw Exception('Unexpected response: ${response.statusCode}');
  //   }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // coba 1
  // Future<RegisterResponse> postRegisterAuthRepository({
  //   required String nama_pengguna,
  //   required String noWhatsapp,
  //   required String kecamatan,
  //   required String desa,
  //   required String role,
  //   required String roleBidang,
  //   required String kodeOtp,
  //   required String password,
  //   required String status,
  // }) async {
  //   Uri url = Uri.parse(ApiHelper.url + 'registrasi1.php');
  //   var response = await http.post(url, body: {
  //     'nama_pengguna': nama_pengguna,
  //     'no_whatsapp': noWhatsapp,
  //     'kecamatan': kecamatan,
  //     'desa': desa,
  //     'role': role,
  //     'role_bidang': roleBidang,
  //     'password': password,
  //     'kode_otp': kodeOtp,
  //     'status': status,
  //   });
  
  //   if (response.statusCode == 200) {
  //     if (response.body.isNotEmpty) {
  //       var body = json.decode(response.body);
  //       print('Auth Repository: ${body}');
  //       if (body is Map<String, dynamic>) {
  //         return AuthResponse.fromJson(body);
  //       } else {
  //         throw Exception('Invalid response format');
  //       }
  //     } else {
  //       throw Exception('Empty response body');
  //     }
  //   } else {
  //     throw Exception('Failed to connect to the server');
  //   }
  // }

