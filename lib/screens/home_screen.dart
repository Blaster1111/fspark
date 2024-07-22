import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';
import 'package:fspark_task/widgets/home_header_widget.dart';
import 'package:fspark_task/widgets/appointment_widget.dart';
import 'package:fspark_task/widgets/searchbar_widget.dart';
import 'package:fspark_task/widgets/treatment_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundolor,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeaderWidget(),
                SizedBox(height: 20),
                SearchBarWidget(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Remainders',
                        style: TextStyle(
                            color: grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                    TextButton(
                      onPressed: () {},
                      child: Text('View all',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppointmentWidget(),
                SizedBox(height: 20),
                Text('My Treatment',
                    style: TextStyle(
                        color: grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 10),
                TreatmentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
