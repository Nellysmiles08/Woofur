import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_facility_manager_widget.dart' show ContactFacilityManagerWidget;
import 'package:flutter/material.dart';

class ContactFacilityManagerModel
    extends FlutterFlowModel<ContactFacilityManagerWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> chatListManager = [];
  void addToChatListManager(DocumentReference item) =>
      chatListManager.add(item);
  void removeFromChatListManager(DocumentReference item) =>
      chatListManager.remove(item);
  void removeAtIndexFromChatListManager(int index) =>
      chatListManager.removeAt(index);
  void insertAtIndexInChatListManager(int index, DocumentReference item) =>
      chatListManager.insert(index, item);
  void updateChatListManagerAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      chatListManager[index] = updateFn(chatListManager[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatsRecord? chatRef2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? newChat2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
