import 'package:flutter/material.dart';

/// Mapper-Klasse für Equipment-Icons
///
/// Diese Klasse ordnet Equipment-Strings aus der Datenbank
/// passenden Material Icons zu.
class IconMap {
  // Private Constructor verhindert Instanzierung
  IconMap._();

  /// Map mit exakten Matches (Case-Insensitive)
  static final Map<String, IconData> _exactMatches = {
    // Barrierefreiheit
    'barrierefrei': Icons.accessible,
    'rollstuhlgerecht': Icons.accessible,
    'aufzug': Icons.elevator,
    'lift': Icons.elevator,

    // Technik & Medien
    'beamer': Icons.present_to_all,
    'projektor': Icons.present_to_all,
    'projektionswand': Icons.aspect_ratio,
    'pc': Icons.computer,
    'computer': Icons.computer,
    'visualizer': Icons.videocam,
    'kamera': Icons.videocam,

    // Internet & Netzwerk
    'wlan': Icons.wifi,
    'wifi': Icons.wifi,
    'internetanschluß': Icons.settings_input_hdmi_outlined,
    'internetanschluss': Icons.settings_input_hdmi_outlined,
    'netzwerk': Icons.wifi,

    // Audio
    'lautsprecher': Icons.volume_up,
    'mikrofon': Icons.mic,
    'audio': Icons.speaker,
    'sound': Icons.speaker,

    // Schreibflächen
    'tafel': Icons.border_color,
    'whiteboard': Icons.border_color,
    'flipchart': Icons.edit_note,

    // Möbel & Ausstattung
    'tische': Icons.table_restaurant,
    'tisch': Icons.table_restaurant,
    'feste bestuhlung': Icons.event_seat,
    'lose bestuhlung': Icons.chair,
    'stühle': Icons.chair,
    'stuhl': Icons.chair,
    'sitzreihen ansteigend': Icons.stairs,

    // Klima & Licht
    'klimatisiert': Icons.ac_unit,
    'klimaanlage': Icons.ac_unit,
    'verdunkelungsmöglichkeit': Icons.wb_sunny,
    'verdunklung': Icons.wb_sunny,
    'licht': Icons.lightbulb,

    // Sonstiges
    'uhr': Icons.access_time,
    'kühlschrank': Icons.kitchen,
    'drucker': Icons.print,
  };

  /// Fallback-Regeln basierend auf Stichwörtern
  static final Map<String, IconData> _keywordMatches = {
    'barrierefrei': Icons.accessible,
    'rollstuhl': Icons.accessible,
    'rampe': Icons.accessible,

    'beamer': Icons.present_to_all,
    'projekt': Icons.present_to_all,

    'computer': Icons.computer,
    'rechner': Icons.computer,

    'wlan': Icons.wifi,
    'wifi': Icons.wifi,
    'internet': Icons.wifi,
    'netz': Icons.wifi,

    'mikro': Icons.mic,
    'lautspr': Icons.volume_up,
    'audio': Icons.speaker,

    'tafel': Icons.border_color,
    'board': Icons.border_color,

    'tisch': Icons.table_restaurant,
    'stuhl': Icons.chair,
    'sitz': Icons.event_seat,

    'klima': Icons.ac_unit,
    'verdunk': Icons.wb_sunny,

    'uhr': Icons.access_time,
    'zeit': Icons.access_time,
  };

  /// Gibt das passende Icon für ein Equipment-Item zurück
  ///
  /// Sucht zuerst nach exakten Matches, dann nach Keyword-Matches
  /// und gibt als Fallback ein Standard-Icon zurück.
  static IconData getIcon(String equipment) {
    final normalized = equipment.toLowerCase().trim();

    // 1. Exakte Übereinstimmung prüfen
    if (_exactMatches.containsKey(normalized)) {
      return _exactMatches[normalized]!;
    }

    // 2. Keyword-basierte Suche
    for (final entry in _keywordMatches.entries) {
      if (normalized.contains(entry.key)) {
        return entry.value;
      }
    }

    // 3. Fallback Icon
    return Icons.check_circle_outline;
  }

  /// Gibt eine Liste aller verfügbaren Equipment-Strings zurück
  /// (nützlich für Entwicklung/Debugging)
  static List<String> get availableEquipment => _exactMatches.keys.toList();

  /// Prüft, ob für ein Equipment ein spezifisches Icon existiert
  static bool hasSpecificIcon(String equipment) {
    final normalized = equipment.toLowerCase().trim();

    if (_exactMatches.containsKey(normalized)) {
      return true;
    }

    for (final keyword in _keywordMatches.keys) {
      if (normalized.contains(keyword)) {
        return true;
      }
    }

    return false;
  }

  /// Gibt alle Equipment-Items zurück, die das Standard-Fallback-Icon verwenden
  /// (nützlich um fehlende Mappings zu identifizieren)
  static List<String> getUnmappedEquipment(List<String> equipmentList) {
    return equipmentList.where((eq) => !hasSpecificIcon(eq)).toList();
  }
}

/// Extension für einfacheren Zugriff auf Icons
extension EquipmentIconExtension on String {
  IconData get equipmentIcon => IconMap.getIcon(this);
  bool get hasSpecificEquipmentIcon => IconMap.hasSpecificIcon(this);
}
