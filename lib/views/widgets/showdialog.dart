import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    Key? key,
    required this.alert,
  }) : super(key: key);

  final AlertDialog alert;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: kBackground,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return alert;
              });
        },
        icon: const Icon(Icons.add),
        iconSize: 40,
      ),
    );
  }
}
