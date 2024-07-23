import 'package:flutter/material.dart';
import 'package:fspark_task/model/message.model.dart';
import 'package:fspark_task/widgets/message_widget.dart';
import 'package:image_picker/image_picker.dart';

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
      text: "Thanks Doc!",
      isMe: false,
      timestamp: DateTime.now(),
    ),
  ];

  TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _sendMessage({String? imageUrl}) {
    if (_controller.text.isNotEmpty || imageUrl != null) {
      setState(() {
        messages.add(Message(
          text: _controller.text,
          isMe: true,
          timestamp: DateTime.now(),
          imageUrl: imageUrl,
        ));
        _controller.clear();
      });
    }
  }

  Future<void> _captureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _sendMessage(imageUrl: photo.path);
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
            onPressed: _captureImage,
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
            onPressed: () => _sendMessage(),
          ),
        ],
      ),
    );
  }
}
