import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:flutter/material.dart';

class LaporanForm extends StatefulWidget {
  @override
  _LaporanFormState createState() => _LaporanFormState();
}

class _LaporanFormState extends State<LaporanForm> {
  final _formKey = GlobalKey<FormState>();
  // Controllers untuk setiap input field
  TextEditingController dusunController = TextEditingController(text: "23");
  TextEditingController pkkRwController = TextEditingController(text: "23");
  // Tambahkan controller untuk field lainnya...

  @override
  void dispose() {
    dusunController.dispose();
    pkkRwController.dispose();
    // Dispose semua controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 4,
        totalSteps: 4,
      ), // AppBar yang sudah kamu miliki
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cek lagi yuk! Kalau ada kesalahan data kamu bisa edit di halaman ini',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                
                _buildSectionTitle('Detail Laporan'),
                _buildInputGroup('Jumlah Kelompok', [
                  {'label': 'Dusun / Lingkungan', 'controller': dusunController},
                  {'label': 'PKK RW', 'controller': pkkRwController},
                  {'label': 'Desa Wisma', 'controller': TextEditingController(text: "23")},
                ]),
                
                _buildInputGroup('Jumlah', [
                  {'label': 'KRT', 'controller': TextEditingController(text: "23")},
                  {'label': 'KK', 'controller': TextEditingController(text: "23")},
                ]),
                
                _buildInputGroup('Jumlah Jiwa', [
                  {'label': 'Laki-laki', 'controller': TextEditingController(text: "23")},
                  {'label': 'Perempuan', 'controller': TextEditingController(text: "23")},
                ]),

                // Tambahkan section lainnya sesuai pola yang sama
                
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Proses simpan data
                      }
                    },
                    child: Text('Kirim'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(title, 
          style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Colors.blue[800])),
    );
  }

  Widget _buildInputGroup(String groupTitle, List<Map<String, dynamic>> inputs) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(groupTitle, style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 12),
            ...inputs.map((input) => Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: TextFormField(
                controller: input['controller'],
                decoration: InputDecoration(
                  labelText: input['label'],
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap diisi';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Harus angka';
                  }
                  return null;
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}