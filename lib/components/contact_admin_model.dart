import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_admin_widget.dart' show ContactAdminWidget;
import 'package:flutter/material.dart';

class ContactAdminModel extends FlutterFlowModel<ContactAdminWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> chatList = [];
  void addToChatList(DocumentReference item) => chatList.add(item);
  void removeFromChatList(DocumentReference item) => chatList.remove(item);
  void removeAtIndexFromChatList(int index) => chatList.removeAt(index);
  void insertAtIndexInChatList(int index, DocumentReference item) =>
      chatList.insert(index, item);
  void updateChatListAtIndex(int index, Function(DocumentReference) updateFn) =>
      chatList[index] = updateFn(chatList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatsRecord? chatRef;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? newChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
