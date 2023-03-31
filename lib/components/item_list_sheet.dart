import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/style.dart';

class ItemListSheet extends StatelessWidget {
  final String name;
  final Duration duration;
  final double price;
  final Function pressed;
  const ItemListSheet({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: () {
            pressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                name,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                '$price dh',
                style: GoogleFonts.ubuntu(
                  fontSize: 15.0,
                ),
              ),
              Text(
                '${duration.inMinutes} min',
                style: GoogleFonts.ubuntu(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Divider(
          color: secondaryColor.withOpacity(0.1),
          height: 1.0,
          thickness: 1.0,
        ),
      ],
    );
  }
}
