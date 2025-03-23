import 'package:flutter/material.dart';

class SessionErrorDialog extends StatelessWidget {
  VoidCallback? _onClickHereTap;

  SessionErrorDialog({super.key, required VoidCallback onClickHereTap}) {
    _onClickHereTap = onClickHereTap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1)),
        child: Wrap(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const Text(
                    "You are not eligible to create a session.\nTo be able to create a session.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  GestureDetector(
                    onTap: _onClickHereTap,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Click here",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
