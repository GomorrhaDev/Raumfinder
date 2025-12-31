import 'package:raumfinder/data/coordinates.dart';
import 'package:raumfinder/data/occupation.dart';
import 'package:raumfinder/data/room.dart';

final List<Room> mockRooms = [
  Room( // AM 1 - Audimax
    name: "AM 1 - Audimax",
    building_name: "Audimax",
    building_number: "65",
    capacity: 576,
    roomNumber: "	065 000 00 005.00",
    size: 577,
    equipment: ["feste Bestuhlung", "Sitzreihen ansteigend", "Tische", "klimatisiert", "Tafel", "Verdunkelungsmöglichkeit", "Projektionswand", "Beamer", "Internetanschluß", "PC", "WLAN", "Uhr", "Lautsprecher", "Mikrofon", "barrierefrei"],
    coordinates: Coordinates(latitude: 53.83424510447914, longitude: 10.700101839618801),
    bookings: [
      //Ferien
      Occupation(date: DateTime(2025, 12, 24, 10, 15), duration: Duration(minutes: 90), eventName: "Biologie für Mediziner / MED1-10031Bio / Vorlesung", instructor: "Hartmann"),
      Occupation(date: DateTime(2025, 12, 24, 18, 00), duration: Duration(hours: 4), eventName: "Proben der Lübeck Popsymphonics", instructor: "Zemke"),
      Occupation(date: DateTime(2025, 12, 31, 10, 15), duration: Duration(minutes: 90), eventName: "Biologie für Mediziner / MED1-10031Bio / Vorlesung", instructor: "Hartmann"),
      Occupation(date: DateTime(2025, 12, 31, 18, 00), duration: Duration(hours: 4), eventName: "Proben der Lübeck Popsymphonics", instructor: "Zemke"),

      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 10, 00), duration: Duration(hours: 2), eventName: "EinfProg V Theorie", instructor: "Fischer"),
      Occupation(date: DateTime(2026, 1, 5, 12, 00), duration: Duration(hours: 2), eventName: "Signal VL", instructor: "Droigk"),
      Occupation(date: DateTime(2026, 1, 5, 14, 00), duration: Duration(hours: 2), eventName: "LADS 1 V", instructor: "Modersitzki"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 9, 00), duration: Duration(hours: 1), eventName: "AC Medizin / AC V", instructor: "Weimar"),
      Occupation(date: DateTime(2026, 1, 6, 10, 00), duration: Duration(hours: 2), eventName: "Ana1KP08, Ana1KP09 V", instructor: "Prestin"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 2), eventName: "MBG", instructor: "Koch"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 2), eventName: "EinfProg V Java", instructor: "Fischer"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 8, 00), duration: Duration(hours: 2), eventName: "EMedTec", instructor: "Gräfe"),
      Occupation(date: DateTime(2026, 1, 7, 10, 15), duration: Duration(minutes: 90), eventName: "Bio1KP08 / Biologie für Mediziner", instructor: "Hartmann"),
      Occupation(date: DateTime(2026, 1, 7, 12, 00), duration: Duration(hours: 2), eventName: "KogPsy", instructor: "Franke"),
      Occupation(date: DateTime(2026, 1, 7, 16, 00), duration: Duration(hours: 2), eventName: "BioMaKP05; Biomathe V", instructor: "Bey"),
      Occupation(date: DateTime(2026, 1, 7, 18, 00), duration: Duration(hours: 4), eventName: "Proben der Lübeck Popsymphonics", instructor: "Zemke"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 8, 00), duration: Duration(hours: 1), eventName: "AC Übungen", instructor: "Weimar"),
      Occupation(date: DateTime(2026, 1, 8, 10, 15), duration: Duration(minutes: 90), eventName: "Bio1KP08 / Biologie für Mediziner", instructor: "Hartmann"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(hours: 2), eventName: "PY2601 Grundlagen der Medizin", instructor: "Paulus"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 2), eventName: "LADS 1 V", instructor: "Modersitzki"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 8, 00), duration: Duration(hours: 2), eventName: "Ana1KP08, Ana1KP09 V", instructor: "Prestin"),
      Occupation(date: DateTime(2026, 1, 9, 8, 30), duration: Duration(minutes: 90), eventName: "ETechnik1(V)", instructor: "Rostalski"),
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "AC Medizin / AC V", instructor: "Weimar"),
      Occupation(date: DateTime(2026, 1, 9, 13, 00), duration: Duration(hours: 1), eventName: "Seminarklausur für Mediziner", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 9, 14, 00), duration: Duration(hours: 10), eventName: "Neujahrsparty", instructor: "Zemke"), // Ab 14:00 bis Mitternacht
      Occupation(date: DateTime(2026, 1, 9, 14, 15), duration: Duration(minutes: 90), eventName: "ETechnik1 (UE)", instructor: "Rostalski"),

      // Samstag, 10.01.2026
      Occupation(date: DateTime(2026, 1, 10, 7, 00), duration: Duration(hours: 17), eventName: "Neujahrsparty", instructor: "Zemke"),

      // Sonntag, 11.01.2026
      Occupation(date: DateTime(2026, 1, 11, 7, 00), duration: Duration(hours: 17), eventName: "Neujahrsparty", instructor: "Zemke"),
    ]
  ),

  Room( // H 1 - Hörsaal 1 Turmgebäude
    name: "H 1 - Hörsaal 1 Turmgebäude",
    building_name: "Turmgebäude",
    building_number: "70",
    capacity: 140,
    roomNumber: "070.000.00.008.00",
    size: 142,
    equipment: ["feste Bestuhlung", "Sitzreihen ansteigend", "Tafel", "Verdunkelungsmöglichkeit", "Beamer", "Internetanschluß", "PC", "Visualizer", "barrierefrei"],
    coordinates: Coordinates(latitude: 53.83786642290044, longitude: 10.70848161620306),
    bookings: [
      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 8, 00), duration: Duration(hours: 2), eventName: "Neuropsychologie - Störungslehre und Diagnostik / PY2611-KP06", instructor: "Sprenger"),
      Occupation(date: DateTime(2026, 1, 5, 10, 00), duration: Duration(hours: 2), eventName: "Einführung in die Therapie psychischer Störungen / PY2701-KP08", instructor: "Wilhelm-Groch"),
      Occupation(date: DateTime(2026, 1, 5, 12, 00), duration: Duration(minutes: 90), eventName: "Allge Viro V / Zellbio MV V / 1. Exam General Virology", instructor: "Tautz / Isken"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 8, 00), duration: Duration(hours: 2), eventName: "Physio", instructor: "Oster"),
      Occupation(date: DateTime(2026, 1, 6, 10, 00), duration: Duration(hours: 2), eventName: "MPCKP04", instructor: "Abbas"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 2), eventName: "MCI", instructor: "Calero Valdez"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 2), eventName: "UsabUXEng", instructor: "Calero Valdez"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 8, 00), duration: Duration(hours: 2), eventName: "Kryptologie (Cryptology) - CS3420", instructor: "Liskiewicz"),
      Occupation(date: DateTime(2026, 1, 7, 10, 00), duration: Duration(hours: 2), eventName: "Prävention I", instructor: "Noftz"),
      Occupation(date: DateTime(2026, 1, 7, 12, 00), duration: Duration(hours: 2), eventName: "Rob/V", instructor: "Ernst"),
      Occupation(date: DateTime(2026, 1, 7, 14, 00), duration: Duration(minutes: 90), eventName: "Prävention und Gesundheitsförderung", instructor: "Noftz"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 8, 00), duration: Duration(hours: 2), eventName: "MZ5111 Immunologie Master", instructor: "Köhl"),
      Occupation(date: DateTime(2026, 1, 8, 10, 00), duration: Duration(hours: 2), eventName: "Entwicklungspsychologie / PY1100", instructor: "Bunzeck"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(minutes: 90), eventName: "Allge Viro V / Zellbio MV V", instructor: "Tautz / Isken"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 2), eventName: "MMp", instructor: "Jetter"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 9, 00), duration: Duration(hours: 1), eventName: "TheoBiophy UE", instructor: "Paulsen"),
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "TheoBiophy V", instructor: "Paulsen"),
      Occupation(date: DateTime(2026, 1, 9, 12, 15), duration: Duration(minutes: 90), eventName: "Ana1KP09 UE (Ergänzung für MLS)", instructor: "Schoppert"),
    ]
  ),

  Room( // Hörsaal Z 1/2
    name: "Z 1/2 - Hörsaal Z 1/2",
    building_name: "Zentralklinikum",
    building_number: "40",
    capacity: 318,
    coordinates: Coordinates(latitude: 53.835057377669294, longitude: 10.706319640464047),
    size: 360,
    equipment: ["feste Bestuhlung", "Sitzreihen ansteigend", "Tafel", "Verdunkelungsmöglichkeit", "Beamer", "Internetanschluß", "PC", "Visualizer", "WLAN", "Lautsprecher", "Mikrofon", "barrierefrei"],
    roomNumber: "040.222.01.015.00",
    bookings: [
      //Ferien
      Occupation(date: DateTime(2025, 12, 22, 7, 00), duration: Duration(hours: 1), eventName: "Montagsfortbildung", instructor: "Zemke"),
      Occupation(date: DateTime(2025, 12, 22, 7, 00), duration: Duration(hours: 1), eventName: "Früh-Fortbildung Klinik für Anästhesiologie und Intensivmedizin", instructor: "Nau"),
      Occupation(date: DateTime(2025, 12, 24, 10, 15), duration: Duration(minutes: 90), eventName: "SWEng V", instructor: "Wolter"),
      Occupation(date: DateTime(2025, 12, 29, 7, 00), duration: Duration(hours: 1), eventName: "Montagsfortbildung", instructor: "Zemke"),
      Occupation(date: DateTime(2025, 12, 29, 7, 00), duration: Duration(hours: 1), eventName: "Früh-Fortbildung Klinik für Anästhesiologie und Intensivmedizin", instructor: "Nau"),
      Occupation(date: DateTime(2025, 12, 31, 10, 15), duration: Duration(minutes: 90), eventName: "SWEng V", instructor: "Wolter"),
      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 07, 00), duration: Duration(hours: 1), eventName: "Früh-Fortbildung Klinik für Anästhesiologie und Intensivmedizin", instructor: "Nau"),
      Occupation(date: DateTime(2026, 1, 5, 08, 00), duration: Duration(hours: 2), eventName: "U-Kurs", instructor: "Hudowenz"),
      Occupation(date: DateTime(2026, 1, 5, 10, 00), duration: Duration(hours: 2), eventName: "allgemeine Pathologie", instructor: "Kümpers"),
      Occupation(date: DateTime(2026, 1, 5, 12, 00), duration: Duration(hours: 1), eventName: "BCH I Vorl. MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 5, 14, 00), duration: Duration(hours: 2), eventName: "Hauptvorlesung Innere Medizin", instructor: "Marquardt"),
      Occupation(date: DateTime(2026, 1, 5, 16, 00), duration: Duration(hours: 2), eventName: "KlinPharm", instructor: "Schwaninger"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 08, 00), duration: Duration(hours: 2), eventName: "PharmTox VL", instructor: "Häuser"),
      Occupation(date: DateTime(2026, 1, 6, 10, 00), duration: Duration(hours: 2), eventName: "MMTechnik (V)", instructor: "Schrader"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 1), eventName: "BCH I Vorl. MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 6, 13, 15), duration: Duration(minutes: 45), eventName: "Strahlentherapie und Neuroradiologie", instructor: "Rades"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 1), eventName: "Hauptvorlesung Innere Medizin", instructor: "Marquardt"),
      Occupation(date: DateTime(2026, 1, 6, 15, 00), duration: Duration(hours: 1), eventName: "Vorles. Chirurgie", instructor: "Keck"),
      Occupation(date: DateTime(2026, 1, 6, 16, 00), duration: Duration(hours: 2), eventName: "Hauptvorlesung Frauenheilkunde [HM4BPGyn VL]", instructor: "Cirkel"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 08, 00), duration: Duration(hours: 2), eventName: "PF1100-Skills", instructor: "N.N."),
      Occupation(date: DateTime(2026, 1, 7, 10, 15), duration: Duration(minutes: 90), eventName: "SWEng V", instructor: "Wolter"),
      Occupation(date: DateTime(2026, 1, 7, 12, 00), duration: Duration(hours: 1), eventName: "BCH I Vorl. MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 7, 14, 00), duration: Duration(hours: 1), eventName: "Vorles. Chirurgie", instructor: "Keck"),
      Occupation(date: DateTime(2026, 1, 7, 15, 00), duration: Duration(hours: 2), eventName: "Hauptvorlesung Pädiatrie", instructor: "Hiort"),
      Occupation(date: DateTime(2026, 1, 7, 17, 00), duration: Duration(hours: 1), eventName: "Hauptvorlesung Innere Medizin", instructor: "Marquardt"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 08, 00), duration: Duration(hours: 2), eventName: "Gesundheitsökonomie und Qualitätsmanagement", instructor: "Elsner"),
      Occupation(date: DateTime(2026, 1, 8, 10, 00), duration: Duration(hours: 2), eventName: "allgemeine Pathologie", instructor: "Sailer"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(hours: 1), eventName: "BCH I Vorl. MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 1), eventName: "Vorles. Chirurgie", instructor: "Keck"),
      Occupation(date: DateTime(2026, 1, 8, 15, 00), duration: Duration(hours: 1), eventName: "Hauptvorlesung Rechtsmedizin", instructor: "Preuß-Wössner"),
      Occupation(date: DateTime(2026, 1, 8, 16, 00), duration: Duration(hours: 2), eventName: "Klinisch-pathologische Konferenz [HM5Q05 Patho VL]", instructor: "N.N."),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "BCH I Vorl MLS-MEW", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 9, 12, 00), duration: Duration(hours: 1), eventName: "BCH I Vorl. MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 9, 13, 00), duration: Duration(hours: 2), eventName: "Klin. Med.", instructor: "Kampmeyer"),
      Occupation(date: DateTime(2026, 1, 9, 15, 00), duration: Duration(hours: 1), eventName: "Anaesthesie", instructor: "Nau"),
      Occupation(date: DateTime(2026, 1, 9, 16, 00), duration: Duration(hours: 1), eventName: "Kreißsaal Abend", instructor: "Brachmann"),
    ]
  ),

  Room( // C3-S01
    name: "C3-S01",
    coordinates: Coordinates(latitude: 53.83636577406219, longitude: 10.702687773202845),
    building_name: "Container 3",
    building_number: "58.3",
    roomNumber: "058.300.00.001.00",
    equipment: ["lose Bestuhlung", "Tische", "Tafel", "Beamer", "Internetanschluß", "PC", "WLAN", "Uhr", "Lautsprecher", "barrierefrei"],
    capacity: 30,
    size: 56,
    bookings: [
      //Ferien
      Occupation(date: DateTime(2025, 12, 22, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 23, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 24, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 25, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 29, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 30, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 31, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 01, 01, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),

      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 5, 18, 00), duration: Duration(hours: 6), eventName: "Blockiert für Fachschaftssitzungen", instructor: "Köhl"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 6, 10, 00), duration: Duration(hours: 2), eventName: "Testtheorie Gruppe A / Seminar", instructor: "Kloosterman"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 1), eventName: "SWEng Ü", instructor: "Wolter"),
      Occupation(date: DateTime(2026, 1, 6, 13, 00), duration: Duration(hours: 1), eventName: "SWEng Ü", instructor: "Wolter"),
      Occupation(date: DateTime(2026, 1, 6, 14, 15), duration: Duration(minutes: 90), eventName: "Evi3", instructor: "N.N."),
      Occupation(date: DateTime(2026, 1, 6, 18, 00), duration: Duration(hours: 5), eventName: "Sitzung der FS Psy", instructor: "Köhl"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 7, 10, 00), duration: Duration(hours: 2), eventName: "VLModKP05", instructor: "Vonthein"),
      Occupation(date: DateTime(2026, 1, 7, 14, 00), duration: Duration(hours: 2), eventName: "PF3180-Heilkunde 2", instructor: "Hertel"),
      Occupation(date: DateTime(2026, 1, 7, 18, 00), duration: Duration(hours: 6), eventName: "Blockiert für Fachschaftssitzungen", instructor: "Köhl"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 8, 10, 00), duration: Duration(hours: 2), eventName: "PWI", instructor: "Fox-Boyer"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(hours: 1), eventName: "EinfSiZuv", instructor: "Sieck"),
      Occupation(date: DateTime(2026, 1, 8, 18, 00), duration: Duration(hours: 5), eventName: "Sitzung der FS MuG", instructor: "Köhl"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 09, 00), duration: Duration(hours: 2), eventName: "MDS V", instructor: "Grzegorzek"),
      Occupation(date: DateTime(2026, 1, 9, 11, 00), duration: Duration(hours: 3), eventName: "MDS Ü", instructor: "Grzegorzek"),
      Occupation(date: DateTime(2026, 1, 9, 16, 00), duration: Duration(hours: 2), eventName: "Seminar Sozialpraktikum", instructor: "N.N."),
      Occupation(date: DateTime(2026, 1, 9, 16, 15), duration: Duration(minutes: 105), eventName: "Erweiterte Erste Hilfe", instructor: "Erber"),

    ]
  ),

  Room( // C3-S02
    name: "C3-S02",
    coordinates: Coordinates(latitude: 53.83636577406219, longitude: 10.702687773202845),
    building_name: "Container 3",
    building_number: "58.3",
    roomNumber: "058.300.00.006.00",
    equipment: ["lose Bestuhlung", "Tische", "Tafel", "Internetanschluß", "PC", "WLAN", "Uhr", "Lautsprecher", "barrierefrei"],
    capacity: 42,
    size: 69,
    bookings: [
      //Ferien
      Occupation(date: DateTime(2025, 12, 22, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 23, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 24, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 25, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 29, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 30, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 12, 31, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      Occupation(date: DateTime(2025, 01, 01, 18, 00), duration: Duration(hours: 6), eventName: "Fachschaftssitzungen", instructor: "Köhl"),
      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 5, 10, 15), duration: Duration(minutes: 90), eventName: "Gesundheitsökonomie und Qualitätsmanagement / Seminar", instructor: "Elsner"),
      Occupation(date: DateTime(2026, 1, 5, 18, 00), duration: Duration(hours: 6), eventName: "Blockiert für Fachschaftssitzungen", instructor: "Köhl"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 6, 10, 00), duration: Duration(hours: 2), eventName: "Schmerzmodul", instructor: "Lüdtke"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 2), eventName: "Testtheorie Gruppe B / Seminar", instructor: "Kloosterman"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 2), eventName: "LST", instructor: "Schildbach"),
      Occupation(date: DateTime(2026, 1, 6, 16, 00), duration: Duration(hours: 2), eventName: "Physik 1 / Übung", instructor: "Rahlves"),
      Occupation(date: DateTime(2026, 1, 6, 18, 00), duration: Duration(hours: 5), eventName: "Sitzung der FS MaIn", instructor: "Köhl"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 7, 10, 00), duration: Duration(hours: 2), eventName: "GW1300-Entwicklungspsychologie", instructor: "Dammermann"),
      Occupation(date: DateTime(2026, 1, 7, 12, 00), duration: Duration(hours: 2), eventName: "SemGenEpi", instructor: "Szymczak"),
      Occupation(date: DateTime(2026, 1, 7, 18, 00), duration: Duration(hours: 6), eventName: "Blockiert für Fachschaftssitzungen", instructor: "Köhl"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 08, 30), duration: Duration(minutes: 90), eventName: "Prakt. Übg. Physiologie", instructor: "Kusche"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(hours: 1), eventName: "DB Ü (Gr 3-ITSec)", instructor: "Groppe"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 2), eventName: "Einführung in das digitale Gesundheitswesen / V", instructor: "Jochems"),
      Occupation(date: DateTime(2026, 1, 8, 18, 00), duration: Duration(hours: 5), eventName: "Sitzung der FS ANT", instructor: "Köhl"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "Bildregistrierung V", instructor: "Lellmann"),
      Occupation(date: DateTime(2026, 1, 9, 12, 00), duration: Duration(hours: 2), eventName: "Einführung in die Medieninformatik / Übung Gruppe 3", instructor: "Jochems"),
      Occupation(date: DateTime(2026, 1, 9, 16, 00), duration: Duration(hours: 2), eventName: "Seminar Sozialpraktikum", instructor: "N.N."),

    ]
  ),
  Room( // T 1 - Hörsaal T 1 
    name: "T 1 - Hörsaal T 1",
    coordinates: Coordinates(latitude: 53.838025, longitude: 10.704336),
    building_name: "Transitorium",
    building_number: "53",
    roomNumber: "053.000.00.902.00",
    equipment: ["feste Bestuhlung", "Sitzreihen ansteigend", "Tafel", "Verdunklungsmöglichkeit", "Beamer", "PC"],
    capacity: 162,
    size: 235,
    bookings: [
      //Ferien
      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 08, 00), duration: Duration(minutes: 120), eventName: "Physio", instructor: "Oster"),
      Occupation(date: DateTime(2026, 1, 5, 10, 00), duration: Duration(minutes: 120), eventName: "Seminar zu Promotion und Wissenschaftlichkeit in Studium / Praxis (ProWiSP): Methoden, Skills und Forschungsfelder / Kliniken / Institute (ehem. zentrales Doktorandensesminar)", instructor: "Noftz"),
      Occupation(date: DateTime(2026, 1, 5, 12, 00), duration: Duration(hours: 2), eventName: "Hauptvorlesung HNO [HM5K08HNO VL]", instructor: "Bruchhage"),
      Occupation(date: DateTime(2026, 1, 5, 14, 00), duration: Duration(hours: 2), eventName: "MPCKP04 Ü", instructor: "Abbas"),
      Occupation(date: DateTime(2026, 1, 5, 16, 00), duration: Duration(hours: 2), eventName: "04. Humanmedizin: Querschnittsbereich Infektiologie u. Immunologie [MED5QB04 Infektio S]", instructor: "Rupp"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 10, 15), duration: Duration(minutes: 105), eventName: "Vorlesung Augenheilkunde", instructor: "Grisanti"),
      Occupation(date: DateTime(2026, 1, 6, 12, 15), duration: Duration(minutes: 45), eventName: "Dermatologie und Venerologie", instructor: "Terheyden"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 2), eventName: "Ana1KP09 UE (MLS)", instructor: "Shoppert"),
      Occupation(date: DateTime(2026, 1, 6, 16, 00), duration: Duration(hours: 2), eventName: "Sicheres SW V", instructor: "Leuker"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 10, 00), duration: Duration(minutes: 120), eventName: "01. Humanmedizin Theorie: Medizinische Mikrobiologie, Hygiene und Virologie [MED3EF10 Mikrobio VL]", instructor: "Rupp"),
      Occupation(date: DateTime(2026, 1, 7, 13, 00), duration: Duration(hours: 1), eventName: "Vorl. Ortho/Rheumat.", instructor: "Russlies"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 08, 00), duration: Duration(minutes: 120), eventName: "Mikrobiologie /MZ 3000/ Vorlesung MLS", instructor: "Friedrich"),
      Occupation(date: DateTime(2026, 1, 8, 10, 00), duration: Duration(hours: 2), eventName: "Theoretische Informatik / CS2000 / Vorlesung", instructor: "Tantau"),
      Occupation(date: DateTime(2026, 1, 8, 12, 00), duration: Duration(hours: 1), eventName: "DIAGRAD5", instructor: "Barkhausen"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 2), eventName: "Biologische Psychologie / PY2000-KP07 / Vorlesung", instructor: "Anders"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "01. Humanmedizin Theorie: Medizinische Mikrobiologie, Hygiene und Virologie [MED3EF10 Mikrobio VL]", instructor: "Rupp"),
      Occupation(date: DateTime(2026, 1, 9, 12, 00), duration: Duration(hours: 2), eventName: "Testtheorie / Vorlesung", instructor: "Utesch"),
      Occupation(date: DateTime(2026, 1, 9, 15, 30), duration: Duration(hours: 2), eventName: "GdS", instructor: "Utesch"),

    ]
  ),
  Room( // C4-S01
    name: "C4-S01",
    coordinates: Coordinates(latitude: 53.838025, longitude: 10.704336),
    building_name: "Transitorium",
    building_number: "58.4",
    roomNumber: "058.400.00.001.00",
    equipment: ["lose Bestuhlung", "Tafel", "Verdunklungsmöglichkeit", "Beamer", "Internetanschluß", "PC", "WLAN", "Uhr", "Lautsprecher", "barrierefrei"],
    capacity: 64,
    size: 69,
    bookings: [
      //Ferien
      // Montag, 05.01.2026
      Occupation(date: DateTime(2026, 1, 5, 08, 00), duration: Duration(minutes: 120), eventName: "Prakt.Sem. BCH I MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 5, 10, 00), duration: Duration(minutes: 120), eventName: "GW2000-KP05", instructor: "Hertel"),
      Occupation(date: DateTime(2026, 1, 5, 13, 00), duration: Duration(minutes: 90), eventName: "Famulaturreifekurs - Neurologie (U-Kurs)", instructor: "Helmchen"),
      Occupation(date: DateTime(2026, 1, 5, 14, 30), duration: Duration(minutes: 90), eventName: "EinBiophy UE", instructor: "Song"),
      Occupation(date: DateTime(2026, 1, 5, 16, 00), duration: Duration(hours: 2), eventName: "Raumbelegung Querschnittsbereich Infektiologie/ Immunologie Gruppenarbeit", instructor: "Rupp"),

      // Dienstag, 06.01.2026
      Occupation(date: DateTime(2026, 1, 6, 09, 00), duration: Duration(hours: 3), eventName: "Dr. Haus - vom Symptom zur Diagnose", instructor: "Kötter"),
      Occupation(date: DateTime(2026, 1, 6, 12, 00), duration: Duration(hours: 2), eventName: "KogPsy", instructor: "Franke"),
      Occupation(date: DateTime(2026, 1, 6, 14, 00), duration: Duration(hours: 2), eventName: "NatUI", instructor: "Jetter"),
      Occupation(date: DateTime(2026, 1, 6, 17, 30), duration: Duration(minutes: 150), eventName: "MBM", instructor: "Faure"),

      // Mittwoch, 07.01.2026
      Occupation(date: DateTime(2026, 1, 7, 08, 00), duration: Duration(minutes: 120), eventName: "Prakt.Sem. BCH I MED", instructor: "Krey"),
      Occupation(date: DateTime(2026, 1, 7, 10, 00), duration: Duration(hours: 2), eventName: "ErnMed", instructor: "Sina"),
      Occupation(date: DateTime(2026, 1, 7, 12, 00), duration: Duration(minutes: 120), eventName: "BacProjRAS", instructor: "Berekovic"),
      Occupation(date: DateTime(2026, 1, 7, 16, 00), duration: Duration(hours: 1), eventName: "IfG-WS24-TherHaV", instructor: "Baumgärtner"),
      Occupation(date: DateTime(2026, 1, 7, 18, 00), duration: Duration(minutes: 120), eventName: "Wahlfach (fächerübergreifend): Interdisziplinäre Perspektiven auf Ökologische Nachhaltigkeit / PS1130-KP04", instructor: "Anders"),

      // Donnerstag, 08.01.2026
      Occupation(date: DateTime(2026, 1, 8, 08, 00), duration: Duration(minutes: 120), eventName: "Medizinische Trainingstherapie / PT2510-KP08 / Übung (Gruppe CD)", instructor: "Frankenstein"),
      Occupation(date: DateTime(2026, 1, 8, 10, 00), duration: Duration(hours: 3), eventName: "ABWL", instructor: "Scheiner"),
      Occupation(date: DateTime(2026, 1, 8, 13, 00), duration: Duration(hours: 1), eventName: "Neuropsychologische Diagnostik, Therapie und Begutachtung PY4700-KP05 (Ärztl. Visite)", instructor: "Brüggemann"),
      Occupation(date: DateTime(2026, 1, 8, 14, 00), duration: Duration(hours: 4), eventName: "EinzelStrT S", instructor: "Hübner"),

      // Freitag, 09.01.2026
      Occupation(date: DateTime(2026, 1, 9, 10, 00), duration: Duration(hours: 2), eventName: "Dermatologie/ GW2020-KP06/ Vorlesung", instructor: "Schmidt"),
      Occupation(date: DateTime(2026, 1, 9, 12, 00), duration: Duration(hours: 2), eventName: "Physio", instructor: "Oster"),

      // Samstag, 10.01.2026
      Occupation(date: DateTime(2026, 1, 10, 10, 00), duration: Duration(hours: 8), eventName: "Wahlfach (fächerübergreifend): Interdisziplinäre Perspektiven auf Ökologische Nachhaltigkeit / PS1130-KP04", instructor: "Anders"),

    ]
  ),
];
