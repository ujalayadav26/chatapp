import 'package:chatapp_flutter/components/chat_bubble.dart';
import 'package:chatapp_flutter/components/my_textfield.dart';
import 'package:chatapp_flutter/services/auth/auth_services.dart';
import 'package:chatapp_flutter/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
   ChatPage({super.key,
  required this.receiverEmail,
   required this.receiverID});

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService =ChatService();
  final AuthService _authService = AuthService();
  
  void sendMessage() async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(receiverID,
          _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail)
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput()
        ],
      ),
    );

  }
  Widget _buildMessageList(){
    String senderID =_authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream:_chatService.getMessages(receiverID,senderID),
        builder: (context,snapshot){
if(snapshot.hasError){
  return Text("Error");
}
if(snapshot.connectionState == ConnectionState.waiting){
  return Text("Loading");
}
return ListView(
  children:snapshot.data!
      .docs
      .map((doc) => _buildMessageItem(doc)).toList()
);
        });
  }

Widget _buildMessageItem(DocumentSnapshot doc){
   Map<String,dynamic> data = doc.data() as Map<String,dynamic> ;
   bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
   var alignment=
       isCurrentUser ? Alignment.centerRight:Alignment.centerLeft;

   return Container(
     alignment: alignment,
       child: Column(
         crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end:CrossAxisAlignment.start,
         children: [
           ChatBubble(
               message: data['message'],
               isCurrentUser: isCurrentUser)
         ],
       ));
}
Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
                controller: _messageController,
                hintText: "Type a message",
                obscureText: false,
              )),
          Container(
            decoration: BoxDecoration(
              color: Colors.cyan.shade300,
              shape: BoxShape.circle
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: sendMessage,
                icon:Icon(Icons.arrow_upward,
                color: Colors.white,)),
          )
        ],
      ),
    );
}
}
