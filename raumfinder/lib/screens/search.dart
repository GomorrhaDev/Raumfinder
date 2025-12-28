import 'package:flutter/material.dart';
import 'package:raumfinder/widgets/filter_dialog.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/data/mock_rooms.dart';
import 'package:raumfinder/screens/room_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  late List<Room> _rooms;
  late List<Room> _filteredRooms;

  @override
  void initState() {
    super.initState();

    // 👉 später: API Call
    _rooms = mockRooms;
    _filteredRooms = _rooms;

    _searchController.addListener(_filterRooms);
  }

  void _filterRooms() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredRooms = _rooms;
      } else {
        _filteredRooms = _rooms.where((room) {
          return room.name.toLowerCase().contains(query) ||
              room.roomNumber.toLowerCase().contains(query) ||
              room.building.toString().contains(query);
        }).toList();
      }
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => const FilterDialog(),
    );
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
                    hintText: 'Raum, Gebäude, Nummer …',
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredRooms.length,
              itemBuilder: (context, index) {
                final room = _filteredRooms[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: room.isCurrentlyFree ? Colors.green[100] : Colors.red[100],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: room.isCurrentlyFree ? Colors.green : Colors.red,
                      width: 1.5,
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(
                      room.isCurrentlyFree ? Icons.check_circle : Icons.cancel,
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
                    onTap: () {
                      // Navigation zur Raumdetailseite
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoomDetailScreen(room: room),
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