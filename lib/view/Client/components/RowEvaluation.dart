import 'package:flutter/material.dart';
import 'package:trainr/models/EvaluationModel.dart';

class RowEvaluation extends StatelessWidget {
  EvaluationModel? mModel;

  RowEvaluation({super.key, required EvaluationModel model}) {
    mModel = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Wrap(
        children: [
          Text(
            mModel!.name,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          Container(
            height: 50,
            child: ListView.builder(
                itemCount: mModel!.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mModel!.values[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
