class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;
  final String? imageUrl;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.imageUrl,
  });
}
