import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stay healthy",
                  style: TextStyle(
                    color: grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Gyu Hawkins",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "New York, NY",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
