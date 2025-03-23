import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/components/voice_message/voice_controller.dart';
import 'package:trainr/components/voice_message/voice_message_view.dart';
import 'package:trainr/models/chats/ChatMessageModel.dart';

import '../../../assets/variables/themeColor.dart';

class RowSender extends StatelessWidget {
  final ChatMessageModel chatModel;
  final String role;

  const RowSender({super.key, required this.chatModel, required this.role});

  @override
  Widget build(BuildContext context) {
    return chatModel.type == "text"
        ? _textContainer()
        : chatModel.type == "image"
            ? _imageContainer()
            : _audioContainer();
  }

  Widget _textContainer() {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.secondaryColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              chatModel.message ?? "",
              style: TextStyle(
                fontSize: 14,
                color: role == "trainer"
                    ? ThemeColor.backgroundColor
                    : ThemeColor.textfieldColor,
              ),
            ),
          ),
          CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                ? chatModel.senderProfileImage!
                : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _imageContainer() {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: role == "trainer"
                    ? ThemeColor.textfieldColor
                    : ThemeColor.secondaryColor,
              ),
              padding: const EdgeInsets.all(5),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: chatModel.mediaUrl ?? "",
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
              )),
          CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                ? chatModel.senderProfileImage!
                : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _audioContainer() {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          VoiceMessageView(
            backgroundColor: role == "trainer"
                ? ThemeColor.textfieldColor
                : ThemeColor.secondaryColor,
            activeSliderColor: role == "trainer"
                ? ThemeColor.backgroundColor
                : ThemeColor.primaryColor,
            pauseIcon: Icon(
              Icons.pause_rounded,
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.fontColor,
            ),
            playIcon: Icon(
              Icons.play_arrow_rounded,
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.fontColor,
            ),
            stopDownloadingIcon: Icon(
              Icons.close,
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.fontColor,
            ),
            circlesColor: role == "trainer"
                ? ThemeColor.backgroundColor
                : ThemeColor.primaryColor,
            controller: VoiceController(
              audioSrc: chatModel.mediaUrl ?? "",
              isFile: false,
              onComplete: () {},
              onPause: () {},
              onPlaying: () {},
            ),
          ),
          CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: chatModel.senderProfileImage?.isNotEmpty == true
                ? chatModel.senderProfileImage!
                : "https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg",
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
