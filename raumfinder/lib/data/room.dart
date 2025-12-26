import 'package:raumfinder/data/occupation.dart';
import 'package:raumfinder/data/coordinates.dart';

class Room {
  final String name;
  final Coordinates coordinates;
  final int building;
  final String roomNumber;
  final List<String> equipment;
  final int capacity;
  final int size;

  final List<Occupation> bookings;

  Room({
    required this.name,
    required this.coordinates,
    required this.building,
    required this.roomNumber,
    required this.equipment,
    required this.capacity,
    required this.size,
    this.bookings = const [],
  });
  
}

extension RoomAvailability on Room {
  bool get isCurrentlyFree {
    final now = DateTime.now();
    for (final booking in bookings) {
      final end = booking.date.add(booking.duration);
      if (now.isAfter(booking.date) && now.isBefore(end)) {
        return false; // belegt
      }
    }
    return true; // frei
  }
}
