import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({Key? key}) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Julia Watson',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text('Mayo Clinic, Rochester', style: TextStyle(color: grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date', style: TextStyle(color: grey)),
                  Text('24 Apr, Monday',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time', style: TextStyle(color: grey)),
                  Text('7:00 am - 7:30 am',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Re-schedule',
                  style: TextStyle(color: white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              ),
              SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: Text('View profile',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
