import 'package:flutter/material.dart';

class GridButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildButton("07-08-2024", "10", "Laporan masuk"),
              _buildButton("07-08-2024", "10", "Laporan revisi"),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              _buildButton("07-08-2024", "10", "Laporan selesai"),
              _buildButton("07-08-2024", "10", "List Desa"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String date, String count, String label) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxHeight: 100),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible( // ◀️ 5. Bungkus dengan Flexible
                    child: Text(date, 
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1, // ◀️ 6. Batasi line text
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(count,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900])),
                  SizedBox(height: 4),
                  Flexible(
                    child:Text(label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[900]),
                      maxLines: 2,
                    ), 
                  )
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}