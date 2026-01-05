import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/data/mock_rooms.dart';

class SearchHistoryStorage {
  static const _key = 'search_history';

  /// SPEICHERN
  static Future<void> save(Map<DateTime, List<Room>> history) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, List<String>> jsonMap = {};
    history.forEach((date, rooms) {
      final key = _dateToString(date);
      jsonMap[key] = rooms.map<String>((r) => r.roomNumber).toList();
    });
    await prefs.setString(_key, jsonEncode(jsonMap));
  }

  /// LADEN
  static Future<Map<DateTime, List<Room>>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return {};
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    final Map<DateTime, List<Room>> result = {};

    decoded.forEach((dateString, roomIds) {
      final date = _stringToDate(dateString);

      result[date] = (roomIds as List<dynamic>)
        .cast<String>()
        .map((id) =>mockRooms.firstWhere((r) => r.roomNumber == id)).toList();
    });

    return result;
  }

  static String _dateToString(DateTime d) =>
      '${d.year}-${d.month}-${d.day}';

  static DateTime _stringToDate(String s) {
    final parts = s.split('-').map(int.parse).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }
}