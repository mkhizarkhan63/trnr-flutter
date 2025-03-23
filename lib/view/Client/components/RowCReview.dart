import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetTrainerReviewResponse.dart';
import 'package:trainr/utils.dart';

class RowCReview extends StatelessWidget {
  RowCReview({super.key, required this.reviewData});

  TrainerReviewData reviewData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ThemeColor.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ThemeColor.textColor,
                ),
                imageUrl:
                    'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: imageProvider,
                  );
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${reviewData.client?.firstName} ${reviewData.client?.lastName}",
                              style: const TextStyle(
                                  color: ThemeColor.primaryColor, fontSize: 14),
                            ),
                          ),
                        ),
                        Text(
                          reviewData.createdAt
                                  ?.timeAgo(reviewData.createdAt ?? "") ??
                              "",
                          style: const TextStyle(
                              color: ThemeColor.primaryColor, fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children:
                                List.generate(reviewData.ratings ?? 0, (index) {
                              return const Icon(
                                Icons.star,
                                size: 15,
                                color: ThemeColor.primaryColor,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(reviewData.reviews ?? "",
                style: const TextStyle(
                    color: ThemeColor.textfieldColor, fontSize: 14)),
          )
        ],
      ),
    );
  }
}
