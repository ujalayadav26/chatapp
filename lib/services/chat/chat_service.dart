import 'package:chatapp_flutter/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Corrected instance property

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshots) {
      // Corrected snapshots variable name
      return snapshots.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, String message) async {
    // Changed message parameter type to String
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );
    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomID = ids.join("_");
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      String userID,
      String otherUserID,
      ) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false) // Corrected 'descending' parameter
        .snapshots();
  }
}