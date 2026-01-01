import 'package:flutter/material.dart';
import 'package:raumfinder/widgets/filter_dialog.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/data/mock_rooms.dart';
import 'package:raumfinder/screens/room_detail_screen.dart';
import 'package:raumfinder/data/room_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RoomFilter? _activeFilter;
  final TextEditingController _searchController = TextEditingController();

  late List<Room> _rooms;
  late List<Room> _filteredRooms;

  @override
  void initState() {
    super.initState();

    _rooms = mockRooms;
    _filteredRooms = _rooms;

    _searchController.addListener(_filterRooms);
  }

  void _filterRooms() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredRooms = _rooms.where((room) {
        // 1. Suchtext-Filter (Name, Gebäude, Dozent, etc.)
        final matchesSearch = query.isEmpty ||
            room.name.toLowerCase().contains(query) ||
            room.roomNumber.toLowerCase().contains(query) ||
            room.building_number.toLowerCase().contains(query) ||
            room.building_name.toLowerCase().contains(query) ||
            room.bookings.any((b) =>
                b.eventName.toLowerCase().contains(query) ||
                b.instructor.toLowerCase().contains(query));

        if (!matchesSearch) return false;

        // 2. Aktive Filter anwenden
        if (_activeFilter != null) {
          final f = _activeFilter!;

          // Gebäude
          if (f.building != null && room.building_name != f.building) {
            return false;
          }

          // Sitze
          if (f.minSeats != null && room.capacity < f.minSeats!) return false;
          if (f.maxSeats != null && room.capacity > f.maxSeats!) return false;

          // Größe (m²)
          if (f.minSize != null && room.size < f.minSize!) return false;
          if (f.maxSize != null && room.size > f.maxSize!) return false;

          // Ausstattung (Prüfen, ob ALLE gewählten Items vorhanden sind)
          if (f.equipment != null && f.equipment!.isNotEmpty) {
            if (!f.equipment!.every((item) => room.equipment.contains(item))) {
              return false;
            }
          }

          // Barrierefreiheit (Ebenfalls gegen room.equipment prüfen)
          if (f.accessibility != null && f.accessibility!.isNotEmpty) {
            if (!f.accessibility!.every((item) => room.equipment.contains(item))) {
              return false;
            }
          }
        }

        return true;
      }).toList();
    });
  }

  void _showFilterDialog() async {
    final result = await showDialog<RoomFilter>(
      context: context,
      builder: (context) => FilterDialog(initialFilter: _activeFilter),
    );

    if (result != null) {
      setState(() {
        _activeFilter = result;
        _filterRooms();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Filter angewendet')),
      );
    }
  }


  String _getMatchInfo(Room room, String query) {
    if (query.isEmpty) return '';
    
    final lowerQuery = query.toLowerCase();
    
    // Check für Veranstaltung
    final matchingEvent = room.bookings.firstWhere(
      (booking) => booking.eventName.toLowerCase().contains(lowerQuery),
      orElse: () => room.bookings.firstWhere(
        (booking) => booking.instructor.toLowerCase().contains(lowerQuery),
        orElse: () => room.bookings.first,
      ),
    );
    
    if (room.bookings.any((b) => 
        b.eventName.toLowerCase().contains(lowerQuery) ||
        b.instructor.toLowerCase().contains(lowerQuery))) {
      return matchingEvent.eventName;
    }
    
    return '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5EB3C7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C5F6F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Suche',
          style: TextStyle(
            color: Color(0xFF2C5F6F),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search + Filter
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Raum, Gebäude, Veranstaltung, Dozent …',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _showFilterDialog,
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter öffnen'),
                ),
              ],
            ),
          ),

          // Room List
          Expanded(
            child: _filteredRooms.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Keine Räume gefunden',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Versuche einen anderen Suchbegriff',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredRooms.length,
                    itemBuilder: (context, index) {
                      final room = _filteredRooms[index];
                      final matchInfo = _getMatchInfo(room, _searchController.text);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: room.isCurrentlyFree
                              ? Colors.green[100]
                              : Colors.red[100],
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: room.isCurrentlyFree ? Colors.green : Colors.red,
                            width: 1.5,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(
                            room.isCurrentlyFree
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: room.isCurrentlyFree ? Colors.green : Colors.red,
                          ),
                          title: Text(
                            room.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: matchInfo.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.event,
                                        size: 14,
                                        color: Color(0xFF5EB3C7),
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          matchInfo,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF2C5F6F),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : null,
                          onTap: () {
                            // Navigation zur Raumdetailseite
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RoomDetailScreen(room: room),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}