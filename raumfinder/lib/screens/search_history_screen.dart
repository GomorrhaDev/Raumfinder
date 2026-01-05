import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/screens/room_detail_screen.dart';

class SearchHistoryScreen extends StatelessWidget {
  final Map<DateTime, List<Room>> searchHistory;

  const SearchHistoryScreen({super.key, required this.searchHistory});

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    bool sameDay(DateTime a, DateTime b) =>
        a.year == b.year && a.month == b.month && a.day == b.day;

    if (sameDay(date, now)) return 'Heute';
    if (sameDay(date, yesterday)) return 'Gestern';

    return DateFormat('dd.MM.yyyy').format(date);
  }
@override
  Widget build(BuildContext context) {
    final dates = searchHistory.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suchverlauf',
          style: TextStyle(
            color: Color(0xFFE4E4E4),
          ),
        ),
        backgroundColor: const Color(0xFF004B5A),
      ),
      body: dates.isEmpty
          ? const Center(child: Text('Noch keine Suchanfragen'))
          : ListView(
              children: dates.map((date) {
                final rooms = searchHistory[date]!;

                return ExpansionTile(
                  title: Text(
                    _formatDate(date),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C5F6F),
                    ),
                  ),
                  children: rooms.map((room) {
                    return ListTile(
                      title: Text(room.name),
                      subtitle: Text(
                        'Gebäude ${room.buildingNumber} • Raum ${room.roomNumber}',
                      ),
                      leading: Icon(
                        room.isCurrentlyFree
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: room.isCurrentlyFree
                            ? Colors.green
                            : Colors.red,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomDetailScreen(room: room),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }
}