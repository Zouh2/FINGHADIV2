import 'package:fen_ghadi/utilis/style.dart';
import 'package:flutter/material.dart';

import '../utilis/style.dart';

class PrimaryButton extends StatelessWidget {
  final String textContent;
  const PrimaryButton({super.key, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 3,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(100, 40),
      ),
      onPressed: () {},
      child: Text(
        textContent,
        style: tButton,
      ),
    );
  }
}
