import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';
import 'package:fspark_task/model/message.model.dart';

class OwnMessageBubble extends StatelessWidget {
  final Message message;

  OwnMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 50, right: 8, top: 8, bottom: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(File(message.imageUrl!),
                    width: 200, fit: BoxFit.cover),
              ),
            if (message.text.isNotEmpty)
              Text(
                message.text,
                style: TextStyle(color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}

class OtherMessageBubble extends StatelessWidget {
  final Message message;

  OtherMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 50, left: 8, top: 8, bottom: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
