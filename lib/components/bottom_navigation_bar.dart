import 'package:fen_ghadi/utils/fen_ghadi_icons_icons.dart';
import 'package:flutter/material.dart';

class FGBottomNavigationBar extends StatelessWidget {
  final int index;
  final Function onTap;
  const FGBottomNavigationBar(
      {super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap(),
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Icon(FenGhadiIcons.person),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(FenGhadiIcons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FenGhadiIcons.preferences),
          label: 'Favorite',
        ),
      ],
    );
  }
}
