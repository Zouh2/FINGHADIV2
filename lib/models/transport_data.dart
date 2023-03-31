import 'package:fen_ghadi/models/taxi.dart';
import 'package:fen_ghadi/models/tram.dart';
import 'package:flutter/material.dart';

import 'bus.dart';

class TransportData {
  final String name;
  final Duration duration;
  final double price;
  final IconData icon;
  final Color color;
  Bus? bus;
  Taxi? taxi;
  Tram? tram;
  TransportData({
    required this.name,
    required this.duration,
    required this.price,
    required this.icon,
    required this.color,
    this.bus,
    this.taxi,
    this.tram,
  });
}
