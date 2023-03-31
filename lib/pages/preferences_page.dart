import 'package:fen_ghadi/utils/style.dart';
import 'package:flutter/material.dart';

import '../utils/fen_ghadi_icons_icons.dart';

class PreferencesPage extends StatefulWidget {
  final bool isTaxiChecked;
  final bool isBusChecked;
  final bool isTramChecked;
  final Function(bool, bool, bool) onPreferenceChanged;

  const PreferencesPage({
    super.key,
    required this.isBusChecked,
    required this.isTaxiChecked,
    required this.isTramChecked,
    required this.onPreferenceChanged,
  });

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: Column(children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: fgLightOrange,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              FenGhadiIcons.taxi,
              color: secondaryColor,
            ),
          ),
          value: widget.isTaxiChecked,
          title: const Text(
            'Taxi',
            style: TextStyle(fontSize: 20.0),
          ),
          onChanged: (isChecked) {
            setState(() {
              widget.onPreferenceChanged(
                  widget.isBusChecked, isChecked, widget.isTramChecked);
            });
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: fgLightOrange,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              FenGhadiIcons.bus,
              color: secondaryColor,
            ),
          ),
          value: widget.isBusChecked,
          title: const Text(
            'Bus',
            style: TextStyle(fontSize: 20.0),
          ),
          onChanged: (isChecked) {
            setState(() {
              widget.onPreferenceChanged(
                  isChecked, widget.isTaxiChecked, widget.isTramChecked);
            });
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: fgLightOrange,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              FenGhadiIcons.tram,
              color: secondaryColor,
            ),
          ),
          value: widget.isTramChecked,
          title: const Text(
            'Tram',
            style: TextStyle(fontSize: 20.0),
          ),
          onChanged: (isChecked) {
            setState(() {
              widget.onPreferenceChanged(
                  widget.isBusChecked, widget.isTaxiChecked, isChecked);
            });
          },
        ),
      ]),
    );
  }
}
