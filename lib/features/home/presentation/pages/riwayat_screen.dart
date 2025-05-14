import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key, String? role});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halaman Riwayat',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
