import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
 final String message;
 final bool isCurrentUser;
  const ChatBubble({super.key,
  required this.message,
  required this.isCurrentUser});

  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.red.shade200 :Colors.amber.shade200,
        borderRadius: BorderRadius.circular(15)

      ),

        padding: const EdgeInsets.all(16),
        margin : const EdgeInsets.symmetric(vertical: 2.5,horizontal: 25),
        child: Text(message,
        style: TextStyle(
        color: Colors.white),

      ),
    );
  }
}
