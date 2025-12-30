import 'package:flutter/material.dart';

class RoomFilter {
  final String? building;
  final int? minSeats;
  final int? maxSeats;
  final String? equipment;
  final String? accessibility;
  final DateTime date;
  final TimeOfDay time;
  final int? minSize;
  final int? maxSize;
  
  RoomFilter({
    this.building,
    this.minSeats,
    this.maxSeats,
    this.equipment,
    this.accessibility,
    this.minSize,
    this.maxSize,
    required this.date,
    required this.time,
  });
}
