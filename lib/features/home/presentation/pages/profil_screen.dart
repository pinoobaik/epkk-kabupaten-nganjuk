import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key, String? role});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halaman Akun',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
