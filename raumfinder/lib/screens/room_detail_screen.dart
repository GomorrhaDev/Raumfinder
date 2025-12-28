import 'package:flutter/material.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/screens/occupation_screen.dart';
import 'package:raumfinder/utils/icon_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class RoomDetailScreen extends StatefulWidget {
  final Room room;

  const RoomDetailScreen({super.key, required this.room});

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initPosition: GeoPoint(
        latitude: widget.room.coordinates.latitude,
        longitude: widget.room.coordinates.longitude,
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // Nächste Belegung finden
  String _getNextOccupation() {
    final now = DateTime.now();
    final upcomingBookings = widget.room.bookings
        .where((b) => b.date.isAfter(now))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    if (upcomingBookings.isEmpty) {
      return 'Keine weiteren Belegungen';
    }

    final next = upcomingBookings.first;
    final diff = next.date.difference(now);
    
    if (diff.inMinutes < 60) {
      return 'Frei für ${diff.inMinutes} Min';
    } else if (diff.inHours < 24) {
      return 'Frei für ${diff.inHours} Std';
    } else {
      return 'Frei bis ${next.date.day}.${next.date.month}.${next.date.year}';
    }
  }

  Future<void> _openInGoogleMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=${widget.room.coordinates.latitude},${widget.room.coordinates.longitude}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _addMarkerToMap() async {
    try {
      await _mapController.addMarker(
        GeoPoint(
          latitude: widget.room.coordinates.latitude,
          longitude: widget.room.coordinates.longitude,
        ),
        markerIcon: const MarkerIcon(
          icon: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 48,
          ),
        ),
      );
    } catch (e) {
      debugPrint('Fehler beim Hinzufügen des Markers: $e');
    }
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
          'Raumansicht',
          style: TextStyle(
            color: Color(0xFF2C5F6F),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header mit Raumname
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFE8F4F8),
              child: Column(
                children: [
                  Text(
                    'NAME: ${widget.room.name}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C5F6F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Gebäude ${widget.room.building}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5EB3C7),
                    ),
                  ),
                ],
              ),
            ),

            // OpenStreetMap
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: OSMFlutter(
                  controller: _mapController,
                  osmOption: OSMOption(
                    zoomOption: const ZoomOption(
                      initZoom: 16,
                      minZoomLevel: 3,
                      maxZoomLevel: 19,
                      stepZoom: 1.0,
                    ),
                    userLocationMarker: UserLocationMaker(
                      personMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.location_history_rounded,
                          color: Colors.blue,
                          size: 48,
                        ),
                      ),
                      directionArrowMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.double_arrow,
                          size: 48,
                        ),
                      ),
                    ),
                    roadConfiguration: const RoadOption(
                      roadColor: Colors.blueAccent,
                    ),
                  ),
                  onMapIsReady: (isReady) async {
                    if (isReady) {
                      await _addMarkerToMap();
                    }
                  },
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _openInGoogleMaps,
                      icon: const Icon(Icons.location_on),
                      label: const Text('In Google Maps Öffnen'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2C5F6F),
                        side: const BorderSide(color: Color(0xFF2C5F6F)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OccupationPlanScreen(room: widget.room),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2C5F6F),
                        side: const BorderSide(color: Color(0xFF2C5F6F)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Belegung Anzeigen'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Raumdetails
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Raumnummer: ${widget.room.roomNumber}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2C5F6F),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ausstattung:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C5F6F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Ausstattungs-Icons mit Tooltips
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: widget.room.equipment.map((eq) {
                      return Tooltip(
                        message: eq,
                        preferBelow: false,
                        verticalOffset: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C5F6F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        waitDuration: const Duration(milliseconds: 500),
                        child: Icon(
                          IconMap.getIcon(eq),
                          size: 32,
                          color: const Color(0xFF2C5F6F),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Infos
                  const Text(
                    'Infos:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C5F6F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  Row(
                    children: [
                      const Icon(Icons.people, size: 28, color: Color(0xFF2C5F6F)),
                      const SizedBox(width: 12),
                      Text(
                        '${widget.room.capacity} Personen',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2C5F6F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.aspect_ratio, size: 28, color: Color(0xFF2C5F6F)),
                      const SizedBox(width: 12),
                      Text(
                        '${widget.room.size} m²',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2C5F6F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        widget.room.isCurrentlyFree ? Icons.check_circle : Icons.cancel,
                        size: 28,
                        color: widget.room.isCurrentlyFree ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.room.isCurrentlyFree ? _getNextOccupation() : 'Aktuell belegt',
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.room.isCurrentlyFree ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}