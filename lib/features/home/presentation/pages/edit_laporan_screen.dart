import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLaporanScreen extends StatefulWidget {
  final String uuid;
  final int orgId;
  final Map<String, dynamic> initialData;

  const EditLaporanScreen({
    super.key,
    required this.uuid,
    required this.orgId,
    required this.initialData,
  });

  @override
  _EditLaporanScreenState createState() => _EditLaporanScreenState();
}

class _EditLaporanScreenState extends State<EditLaporanScreen> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formData;

  @override
  void initState() {
    super.initState();
    _formData = Map.from(widget.initialData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Laporan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submitForm,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: _buildFormFields(),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields() {
    // Filter field yang tidak perlu diedit
    final editableData = Map.from(_formData)
      ..removeWhere((key, value) => 
        key == 'uuid' || 
        key == 'id_user' || 
        key == 'status' || 
        key == 'created_at' ||
        key == 'id_role' ||
        key == 'id_organization');

    return editableData.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: TextFormField(
          initialValue: entry.value?.toString() ?? '',
          decoration: InputDecoration(
            labelText: _getFieldLabel(entry.key),
            border: const OutlineInputBorder(),
          ),
          onSaved: (newValue) => _formData[entry.key] = newValue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field ini wajib diisi';
            }
            return null;
          },
        ),
      );
    }).toList();
  }

  String _getFieldLabel(String fieldName) {
    // Sama seperti di DetailLaporanScreen
    switch (fieldName) {
      case 'nama_kader': return 'Nama Kader';
      case 'jumlah_kegiatan': return 'Jumlah Kegiatan';
      case 'keterangan': return 'Keterangan';
      default: 
        return fieldName.replaceAll('_', ' ').capitalizeFirst ?? fieldName;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _updateLaporan();
    }
  }

  void _updateLaporan() {
    // Implementasi update ke backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Menyimpan perubahan...')),
    );

    // Setelah berhasil:
    // Navigator.pop(context, true); // Return true untuk indikasi sukses
  }
}