import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/models/chats/ChatMessageModel.dart';

import '../../../assets/variables/themeColor.dart';
import '../../../components/voice_message/voice_controller.dart';
import '../../../components/voice_message/voice_message_view.dart';

class RowReceiver extends StatelessWidget {
  final ChatMessageModel chatModel;
  final String role;

  const RowReceiver({super.key, required this.chatModel, required this.role});

  @override
  Widget build(BuildContext context) {
    return chatModel.type == "text"
        ? _textMessage()
        : chatModel.type == "image"
            ? _imageMessage()
            : _audioContainer();
  }

  Widget _textMessage() {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                ? chatModel.senderProfileImage!
                : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: role == "trainer"
                    ? ThemeColor.primaryColor
                    : ThemeColor.textfieldColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                chatModel.message ?? "",
                style: TextStyle(
                  fontSize: 14,
                  color: role == "trainer"
                      ? ThemeColor.backgroundColor
                      : ThemeColor.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageMessage() {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                ? chatModel.senderProfileImage!
                : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: role == "trainer"
                  ? ThemeColor.primaryColor
                  : ThemeColor.textfieldColor,
            ),
            padding: const EdgeInsets.all(5),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: chatModel.message ?? "",
              imageBuilder: (context, imageProvider) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _audioContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                  ? chatModel.senderProfileImage!
                  : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                );
              },
            ),
          ),
          VoiceMessageView(
            backgroundColor: role == "trainer"
                ? ThemeColor.primaryColor
                : ThemeColor.textfieldColor,
            activeSliderColor: role == "trainer"
                ? ThemeColor.backgroundColor
                : ThemeColor.fontColor,
            circlesColor: role == "trainer"
                ? ThemeColor.backgroundColor
                : ThemeColor.fontColor,
            pauseIcon: Icon(
              Icons.pause_rounded,
              color: role == "trainer"
                  ? ThemeColor.primaryColor
                  : ThemeColor.textfieldColor,
            ),
            playIcon: Icon(
              Icons.play_arrow_rounded,
              color: role == "trainer"
                  ? ThemeColor.primaryColor
                  : ThemeColor.textfieldColor,
            ),
            stopDownloadingIcon: Icon(
              Icons.close,
              color: role == "trainer"
                  ? ThemeColor.primaryColor
                  : ThemeColor.fontColor,
            ),
            controller: VoiceController(
              audioSrc: chatModel.mediaUrl ?? "",
              isFile: false,
              onComplete: () {},
              onPause: () {},
              onPlaying: () {},
            ),
          ),
        ],
      ),
    );
  }
}
