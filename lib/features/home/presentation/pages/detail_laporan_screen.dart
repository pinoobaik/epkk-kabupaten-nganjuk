import 'package:e_pkk_nganjuk/features/home/presentation/pages/edit_laporan_screen.dart';
import 'package:e_pkk_nganjuk/get/controller/detail_laporan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLaporanScreen extends StatelessWidget {
  final String uuid;
  final String title;
  final String subtitle;
  final String status;
  final DateTime createdAt;
  final int idOrganization;

  const DetailLaporanScreen({
    super.key,
    required this.uuid,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.createdAt,
    required this.idOrganization,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailLaporanController(
      getDetailLaporanUsecase: Get.find(),
    ));

    // Load data saat screen pertama kali dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadDetailLaporan(
        uuid: uuid,
        orgId: idOrganization,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(subtitle),
        actions: [
          if (status == 'Proses') 
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _navigateToEditScreen(context),
            ),
          if (status == 'Proses')
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => _showCancelDialog(context),
            ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(context),
              const SizedBox(height: 20),
              _buildDetailFields(controller.laporanDetail),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Status: ${_getStatusLabel(status)}'),
            const SizedBox(height: 8),
            Text('Tanggal: ${DateFormat('dd-MM-yyyy').format(createdAt)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailFields(Map<String, dynamic> data) {
    // Filter out fields yang tidak perlu ditampilkan
    final displayData = Map.from(data)
      ..removeWhere((key, value) => 
        key == 'uuid' || 
        key == 'id_user' || 
        key == 'id_kader_pokja1' ||
        key == 'id_pokja1_bidang1' ||
        key == 'id_pokja1_bidang2' ||
        key == 'id_pokja2_bidang1' ||
        key == 'id_pokja2_bidang2' ||
        key == 'id_kader_pokja3' ||
        key == 'id_pokja3_bidang1' ||
        key == 'id_pokja3_bidang2' ||
        key == 'id_pokja3_bidang3' ||
        key == 'id_kader_pokja4' ||
        key == 'id_pokja4_bidang1' ||
        key == 'id_pokja4_bidang2' ||
        key == 'id_pokja4_bidang3' ||
        key == 'id_laporan_umum' ||
        key == 'status' || 
        key == 'created_at' ||
        key == 'id_role' ||
        key == 'id_organization');

    return Column(
      children: displayData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextFormField(
            initialValue: entry.value?.toString() ?? '-',
            decoration: InputDecoration(
              labelText: _getFieldLabel(entry.key),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[100],
              enabled: false,
            ),
            maxLines: null,
          ),
        );
      }).toList(),
    );
  }

  String _getFieldLabel(String fieldName) {
    // Mapping nama field ke label yang lebih user-friendly
    switch (fieldName) {
      case 'nama_kader': return 'Nama Kader';
      case 'jumlah_kegiatan': return 'Jumlah Kegiatan';
      case 'keterangan': return 'Keterangan';
      // Tambahkan mapping untuk field lainnya
      default: 
        return fieldName.replaceAll('_', ' ').capitalizeFirst ?? fieldName;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'Proses': return 'Sedang Diproses';
      case 'Disetujui1': return 'Disetujui Kecamatan';
      case 'Disetujui2': return 'Disetujui Kabupaten';
      case 'Dibatalkan': return 'Dibatalkan';
      default: return status;
    }
  }

  void _navigateToEditScreen(BuildContext context) async {
    final controller = Get.find<DetailLaporanController>();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditLaporanScreen(
          uuid: uuid,
          orgId: idOrganization,
          initialData: Map.from(controller.laporanDetail),
        ),
      ),
    );

    if (result == true) {
      // Refresh data jika edit berhasil
      controller.loadDetailLaporan(
        uuid: uuid,
        orgId: idOrganization,
      );
    }
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Batalkan Laporan'),
        content: const Text('Apakah Anda yakin ingin membatalkan laporan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _processCancellation(context);
            },
            child: const Text('Ya, Batalkan'),
          ),
        ],
      ),
    );
  }

  void _processCancellation(BuildContext context) async {
    final controller = Get.find<DetailLaporanController>();
    
    try {
      await controller.cancelLaporan(
        uuid: uuid,
        orgId: idOrganization,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Laporan berhasil dibatalkan')),
      );
      
      Navigator.pop(context, true); // Kembali ke screen sebelumnya dengan refresh
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membatalkan: $e')),
      );
    }
  }
}