import 'package:flutter/material.dart';

class StatusFilterCard extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusSelected;

  const StatusFilterCard({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatusButton(context, 'Proses', selectedStatus == 'Proses'),
          _buildStatusButton(context, 'Revisi', selectedStatus == 'Revisi'),
          _buildStatusButton(context, 'Selesai', selectedStatus == 'Selesai'),
        ],
      ),
    );
  }

  Widget _buildStatusButton(BuildContext context, String label, bool isActive) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () => onStatusSelected(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: isActive ? Colors.blue : Colors.white,
            foregroundColor: isActive ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isActive ? Colors.blue : Colors.grey,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
