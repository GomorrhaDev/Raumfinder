import 'package:flutter/material.dart';
import 'package:raumfinder/data/room_filter.dart';
import 'package:raumfinder/data/mock_rooms.dart';

class FilterDialog extends StatefulWidget {
  final RoomFilter? initialFilter;

  const FilterDialog({super.key, this.initialFilter});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? _selectedBuilding;
  
  // Controller für persistente Textfelder
  late TextEditingController _minSeatsController;
  late TextEditingController _maxSeatsController;
  late TextEditingController _minSizeController;
  late TextEditingController _maxSizeController;

  final Set<String> _selectedEquipment = <String>{};
  final Set<String> _selectedAccessibility = <String>{};
  
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  late List<String> _buildings;
  late List<String> _equipment;
  late List<String> _accessibility;

  @override
  void initState() {
    super.initState();

    // 1. Grunddaten aus Mock-Rooms laden
    final buildingSet = <String>{};
    final equipmentSet = <String>{};

    for (final room in mockRooms) {
      if (room.building_name.isNotEmpty) buildingSet.add(room.building_name);
      equipmentSet.addAll(room.equipment);
    }

    final accessSet = equipmentSet.where((e) {
      final lower = e.toLowerCase();
      return lower.contains('barrier') || lower.contains('barriere') || 
             lower.contains('aufzug') || lower.contains('rollstuhl');
    }).toSet();

    _buildings = buildingSet.toList()..sort();
    _equipment = equipmentSet.difference(accessSet).toList()..sort();
    _accessibility = accessSet.toList()..sort();

    // 2. Initialisierung mit Werten aus dem bestehenden Filter
    final f = widget.initialFilter;
    
    _selectedBuilding = f?.building;
    _selectedDate = f?.date ?? DateTime.now();
    _selectedTime = f?.time ?? TimeOfDay.now();
    
    if (f?.equipment != null) _selectedEquipment.addAll(f!.equipment!);
    if (f?.accessibility != null) _selectedAccessibility.addAll(f!.accessibility!);

    // Controller initialisieren
    _minSeatsController = TextEditingController(text: f?.minSeats?.toString() ?? '');
    _maxSeatsController = TextEditingController(text: f?.maxSeats?.toString() ?? '');
    _minSizeController = TextEditingController(text: f?.minSize?.toString() ?? '');
    _maxSizeController = TextEditingController(text: f?.maxSize?.toString() ?? '');
  }

  @override
  void dispose() {
    _minSeatsController.dispose();
    _maxSeatsController.dispose();
    _minSizeController.dispose();
    _maxSizeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filter anpassen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedBuilding = null;
                        _minSeatsController.clear();
                        _maxSeatsController.clear();
                        _minSizeController.clear();
                        _maxSizeController.clear();
                        _selectedEquipment.clear();
                        _selectedAccessibility.clear();
                        _selectedDate = DateTime.now();
                        _selectedTime = TimeOfDay.now();
                      });
                    },
                    child: const Text('Zurücksetzen', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
              const Divider(),

              // Datum & Zeit
              const Text('Zeitraum', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _selectDate,
                      icon: const Icon(Icons.calendar_today, size: 16),
                      label: Text('${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _selectTime,
                      icon: const Icon(Icons.access_time, size: 16),
                      label: Text(_selectedTime.format(context)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Gebäude Dropdown
              const Text('Gebäude', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String?>( // Typ auf String? geändert
                value: _selectedBuilding,
                hint: const Text('Alle Gebäude'),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                // Hier fügen wir manuell die Option "Alle Gebäude" hinzu
                items: [
                  const DropdownMenuItem<String?>(
                    value: null,
                    child: Text('Alle Gebäude'),
                  ),
                  ..._buildings.map((b) => DropdownMenuItem<String?>(
                        value: b,
                        child: Text(b),
                      )),
                ],
                onChanged: (val) {
                  setState(() {
                    _selectedBuilding = val;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Sitze & Größe
              Row(
                children: [
                  Expanded(child: _buildTextField('Min. Sitze', _minSeatsController)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField('Max. Sitze', _maxSeatsController)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _buildTextField('Min. m²', _minSizeController)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField('Max. m²', _maxSizeController)),
                ],
              ),

              const SizedBox(height: 16),

              // Ausstattung Chips
              const Text('Ausstattung', style: TextStyle(fontWeight: FontWeight.w500)),
              Wrap(
                spacing: 6,
                children: _equipment.map((e) => FilterChip(
                  label: Text(e, style: const TextStyle(fontSize: 12)),
                  selected: _selectedEquipment.contains(e),
                  onSelected: (bool selected) {
                    setState(() {
                      selected ? _selectedEquipment.add(e) : _selectedEquipment.remove(e);
                    });
                  },
                )).toList(),
              ),

              const SizedBox(height: 16),

              // Barrierefreiheit Chips
              const Text('Barrierefreiheit', style: TextStyle(fontWeight: FontWeight.w500)),
              Wrap(
                spacing: 6,
                children: _accessibility.map((a) => FilterChip(
                  label: Text(a, style: const TextStyle(fontSize: 12)),
                  selected: _selectedAccessibility.contains(a),
                  onSelected: (bool selected) {
                    setState(() {
                      selected ? _selectedAccessibility.add(a) : _selectedAccessibility.remove(a);
                    });
                  },
                )).toList(),
              ),

              const SizedBox(height: 24),

              // Apply Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9DB0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    final filter = RoomFilter(
                      building: _selectedBuilding,
                      minSeats: int.tryParse(_minSeatsController.text),
                      maxSeats: int.tryParse(_maxSeatsController.text),
                      minSize: int.tryParse(_minSizeController.text),
                      maxSize: int.tryParse(_maxSizeController.text),
                      equipment: _selectedEquipment.isEmpty ? null : _selectedEquipment.toList(),
                      accessibility: _selectedAccessibility.isEmpty ? null : _selectedAccessibility.toList(),
                      date: _selectedDate,
                      time: _selectedTime,
                    );
                    Navigator.pop(context, filter);
                  },
                  child: const Text('Filter anwenden'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}