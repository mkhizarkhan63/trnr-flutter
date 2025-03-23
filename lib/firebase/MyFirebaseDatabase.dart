import 'package:firebase_database/firebase_database.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/chats/ChatMessageModel.dart';
import 'package:trainr/models/chats/ClientDetailsModel.dart';
import 'package:trainr/utils.dart';

class MyFirebaseDatabase {
  static Future<void> createGeneralTrainerChatHead(int trainerId) async {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("primary_trainer_chat").push().set("message");
  }

  static Future<void> sendChatToGeneralTrainer(
      int trainerId, ChatMessageModel chatModel) async {
    final userData = await MySharedPreferences.getUser();

    _findClientById(trainerId);

    final reference = FirebaseDatabase.instance.ref();
    reference
        .child(Constants.generalChatNode)
        .child(Constants.userDetailsNode)
        .child(trainerId.toString()) // trainer id
        .child(userData?.clientId.toString() ?? "")
        .set({
      "clientId": userData?.clientId ?? 0,
      "fullName": "${userData?.firstName} ${userData?.lastName}",
      "profileImage": userData?.profileImage ?? ""
    });

    reference
        .child(Constants.generalChatNode)
        .child(Constants.messagesNode)
        .child(trainerId.toString())
        .child(userData?.clientId.toString() ?? "") // client id
        .push()
        .set(chatModel.toJson());
  }

  static Future<void> sendChatToGeneralClient(
      int clientId, ChatMessageModel chatModel) async {
    final userData = await MySharedPreferences.getUser();

    final reference = FirebaseDatabase.instance.ref();

    reference
        .child(Constants.generalChatNode)
        .child(Constants.messagesNode)
        .child(userData?.trainerId.toString() ?? "")
        .child(clientId.toString() ?? "") // client id
        .push()
        .set(chatModel.toJson());
  }

  static Future<void> _findClientById(int trainerId) async {
    final userData = await MySharedPreferences.getUser();
    final reference = FirebaseDatabase.instance.ref();
    final user = await reference
        .child(Constants.generalChatNode)
        .child(Constants.userDetailsNode)
        .child(trainerId.toString()) // trainer id
        .child(userData?.clientId.toString() ?? "")
        .once();

    print("check client data: ${user.snapshot.value}");
  }

  static Future<void> sendChatToSubscribedTrainer(
      int trainerId, ChatMessageModel chatModel) async {
    final userData = await MySharedPreferences.getUser();

    final reference = FirebaseDatabase.instance.ref();
    reference
        .child(Constants.primaryChatNode)
        .child(trainerId.toString())
        .child(userData?.clientId.toString() ?? "") // client id
        .child("messages")
        .push()
        .set(chatModel.toJson());
  }

  static Future<void> sendChatToSubscribedClient(
      int clientId, ChatMessageModel chatModel) async {
    final userData = await MySharedPreferences.getUser();

    final reference = FirebaseDatabase.instance.ref();
    reference
        .child(Constants.primaryChatNode)
        .child(userData?.trainerId.toString() ?? "") // client id
        .child(clientId.toString())
        .child("messages")
        .push()
        .set(chatModel.toJson());
  }

  static Stream<DatabaseEvent> getGeneralChatMessages(
      int trainerId, int clientId) {
    final reference = FirebaseDatabase.instance.ref();
    return reference
        .child(Constants.generalChatNode)
        .child(Constants.messagesNode)
        .child(trainerId?.toString() ?? "")
        .child(clientId.toString())
        .onValue;
  }

  static Stream<DatabaseEvent> getTrainerGeneralClients(int trainerId) {
    final reference = FirebaseDatabase.instance.ref();
    return reference
        .child(Constants.generalChatNode)
        .child(Constants.userDetailsNode)
        .child(trainerId.toString())
        .onValue;

    /*reference
        .child(Constants.generalChatNode)
        .child(Constants.userDetailsNode)
        .child(trainerId.toString())
        .onValue
        .listen((event) {
      for (var clients in event.snapshot.children) {
        final client = ClientDetailsModel.fromJson(clients.value);

        print("event called: $client");
        // generalClientsList.add(client);
      }

      print("event $event");
    });*/
  }

  Future<void> getPrimaryChatMessages(int trainerId, int clientId) async {
    final reference = FirebaseDatabase.instance.ref();
    reference
        .child(Constants.primaryChatNode)
        .child(trainerId.toString())
        .child(clientId.toString() ?? "") // client id
        .child("messages")
        .onValue
        .listen((event) {
      final data = event.snapshot;

      print("messages event: $data");
    });
  }

  Future<void> sendGeneralChatToClient(
      int clientId, ChatMessageModel chatModel) async {
    final userData = await MySharedPreferences.getUser();
    final reference = FirebaseDatabase.instance.ref();
    reference
        .child(Constants.generalChatNode)
        .child(userData?.trainerId?.toString() ?? "")
        .child(clientId?.toString() ?? "")
        .child("messages")
        .push()
        .set(chatModel.toJson());
  }
}
