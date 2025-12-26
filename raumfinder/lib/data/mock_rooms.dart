import 'package:raumfinder/data/coordinates.dart';
import 'package:raumfinder/data/occupation.dart';
import 'package:raumfinder/data/room.dart';

final List<Room> mockRooms = [
  Room(
    building: 65,
    capacity: 576,
    name: "AM 1 - Audimax",
    roomNumber: "	065 000 00 005.00",
    size: 577,
    equipment: ["feste Bestuhlung, Sitzreihen ansteigend, Tische, klimatisiert, Tafel, Verdunkelungsmöglichkeit, Projektionswand, Beamer, Internetanschluß, PC, WLAN, Uhr, Lautsprecher, Mikrofon, barrierefrei"],
    coordinates: Coordinates(latitude: 53.83424510447914, longitude: 10.700101839618801),
    bookings: [
      Occupation(date: DateTime(2025, 12, 24, 10, 15), duration: Duration(minutes: 90), eventName: "Biologie für Mediziner / MED1-10031Bio / Vorlesung", instructor: "Hartmann"),
      Occupation(date: DateTime(2025, 12, 24, 18, 00), duration: Duration(hours: 4), eventName: "Proben der Lübeck Popsymphonics", instructor: "Zemke")
    ]
  ),
];
