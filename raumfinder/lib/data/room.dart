class Room {
  final String name;
  final Coordinates coordinates;
  final int building;
  final String roomNumber;
  final List<String> equipment;
  final int capacity;
  final int size;

  Room({
    required this.name,
    required this.coordinates,
    required this.building,
    required this.roomNumber,
    required this.equipment,
    required this.capacity,
    required this.size,
  });

  // Room from json
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json['name'] as String,
      coordinates: Coordinates.fromJson(json['coordinates']),
      building: json['building'] as int,
      roomNumber: json['roomNumber'] as String,
      equipment: List<String>.from(json['equipment'] as List),
      capacity: json['capacity'] as int,
      size: json['size'] as int,
    );
  }

  // room to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'coordinates': coordinates.toJson(),
      'building': building,
      'roomNumber': roomNumber,
      'equipment': equipment,
      'capacity': capacity,
      'size': size,
    };
  }

  // CopyWith method for immutability
  Room copyWith({
    String? name,
    Coordinates? coordinates,
    int? building,
    String? roomNumber,
    List<String>? equipment,
    int? capacity,
    int? size,
  }) {
    return Room(
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
      building: building ?? this.building,
      roomNumber: roomNumber ?? this.roomNumber,
      equipment: equipment ?? this.equipment,
      capacity: capacity ?? this.capacity,
      size: size ?? this.size,
    );
  }

  @override
  String toString() {
    return 'Room(name: $name, coordinates: $coordinates, building: $building, '
           'roomNumber: $roomNumber, equipment: $equipment, capacity: $capacity, size: $size)';
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Coordinates(lat: $latitude, lon: $longitude)';
  }
}