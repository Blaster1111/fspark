import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';

class TreatmentWidget extends StatelessWidget {
  const TreatmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTreatmentInfo('24%', 'Cells\nAffected', Colors.red, 0.24),
          _buildTreatmentInfo('76%', 'Normal\nCells', Colors.green, 0.76),
        ],
      ),
    );
  }

  Widget _buildTreatmentInfo(
      String percentage, String label, Color color, double fillPercentage) {
    return Row(
      children: [
        Text(
          percentage,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 16.0),
        Container(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            value: fillPercentage,
            strokeWidth: 2,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
