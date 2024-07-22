import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';
import 'package:intl/intl.dart'; // For date formatting

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;
  // final String? imageUrl;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
    // this.imageUrl
  });
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: "Good Morning!",
        isMe: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 5))),
    Message(
        text: "How are you feeling today?",
        isMe: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 4))),
    Message(
        text: "Dr, I don't feel well.\nI have a cough and a fever.",
        isMe: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 3))),
    Message(
        text: "Can you send me a photo of medicine?",
        isMe: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 2))),
    Message(
      text: "",
      isMe: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      // imageUrl: "assets/medicine_image.jpg"
    ),
    Message(text: "Thanks Doc!", isMe: false, timestamp: DateTime.now()),
  ];

  TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: _controller.text,
          isMe: true,
          timestamp: DateTime.now(),
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index].isMe
                    ? OwnMessageBubble(message: messages[index])
                    : OtherMessageBubble(message: messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.grey),
            onPressed: () {
              // image picking image_picker to be added
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}

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
            // if (message.imageUrl != null)
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image.asset(message.imageUrl!,
            //         width: 200, fit: BoxFit.cover),
            //   ),
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
