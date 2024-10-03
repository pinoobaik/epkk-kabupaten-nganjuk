class ValidatorForm {
  static String? validatePKBN(String? value) {
    if (value == null || value.isEmpty) {
      return 'PKBN tidak boleh kosong';
    }
  }

  static String? validatePKDRT(String? value) {
    if (value == null || value.isEmpty) {
      return 'PKDRT tidak boleh kosong';
    }
  }

  static String? validatePolaA(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pola Asuh tidak boleh kosong';
    }
  }
}
