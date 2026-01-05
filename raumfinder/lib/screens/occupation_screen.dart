import 'package:flutter/material.dart';
import 'package:raumfinder/data/room.dart';
import 'package:raumfinder/data/occupation.dart';
import 'package:intl/intl.dart';

class OccupationPlanScreen extends StatefulWidget {
  final Room room;

  const OccupationPlanScreen({super.key, required this.room});

  @override
  State<OccupationPlanScreen> createState() => _OccupationPlanScreenState();
}

class _OccupationPlanScreenState extends State<OccupationPlanScreen> {
  DateTime _selectedDate = DateTime.now();
  late PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 3);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Occupation> _getOccupationsForDate(DateTime date) {
    return widget.room.bookings.where((booking) {
      return booking.date.year == date.year &&
             booking.date.month == date.month &&
             booking.date.day == date.day;
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  void _changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF5EB3C7),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF2C5F6F),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  String _formatWeekday(DateTime date) {
    // weekday gibt 1-7 zurück, wobei 1 = Montag, 7 = Sonntag
    const weekdays = ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'];
    return weekdays[date.weekday - 1]; // -1 weil Array bei 0 startet
  }

  String _formatMonthYear(DateTime date) {
    const months = [
      'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni',
      'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
           date.month == now.month &&
           date.day == now.day;
  }

  List<DateTime> _getWeekDays() {
    // Finde den Montag der Woche des ausgewählten Datums
    final dayOfWeek = _selectedDate.weekday; // 1 = Montag, 7 = Sonntag
    final startOfWeek = _selectedDate.subtract(Duration(days: dayOfWeek - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final occupations = _getOccupationsForDate(_selectedDate);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF004B5A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4D4D4)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Belegungsplan',
          style: TextStyle(
            color: Color(0xFFD4D4D4),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Color(0xFFD4D4D4)),
            onPressed: _selectDate,
            tooltip: 'Datum wählen',
          ),
        ],
      ),
      body: Column(
        children: [
          // Header mit Rauminfo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFCCDBDE),
            child: Column(
              children: [
                Text(
                  widget.room.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004B5A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Gebäude ${widget.room.building_number} • Raum ${widget.room.roomNumber}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF656565),
                  ),
                ),
              ],
            ),
          ),

          // Monatsnavigation
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Color(0xFF2C5F6F)),
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.subtract(const Duration(days: 7));
                    });
                  },
                ),
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: [
                      Text(
                        _formatMonthYear(_selectedDate),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C5F6F),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF2C5F6F),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Color(0xFF2C5F6F)),
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.add(const Duration(days: 7));
                    });
                  },
                ),
              ],
            ),
          ),

          // Wochenansicht
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getWeekDays().map((date) {
                final isSelected = date.day == _selectedDate.day &&
                                 date.month == _selectedDate.month &&
                                 date.year == _selectedDate.year;
                final isToday = _isToday(date);
                final hasBookings = _getOccupationsForDate(date).isNotEmpty;

                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 45,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF5EB3C7)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: isToday && !isSelected
                          ? Border.all(
                              color: const Color(0xFF5EB3C7),
                              width: 2,
                            )
                          : null,
                    ),
                    child: Column(
                      children: [
                        Text(
                          _formatWeekday(date),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2C5F6F),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2C5F6F),
                          ),
                        ),
                        const SizedBox(height: 2),
                        if (hasBookings)
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF5EB3C7),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Schnellauswahl Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedDate = DateTime.now();
                      });
                    },
                    icon: const Icon(Icons.today, size: 16),
                    label: const Text('Heute'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _isToday(_selectedDate)
                          ? const Color(0xFF5EB3C7)
                          : const Color(0xFF2C5F6F),
                      side: BorderSide(
                        color: _isToday(_selectedDate)
                            ? const Color(0xFF5EB3C7)
                            : const Color(0xFF2C5F6F).withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedDate = DateTime.now().add(const Duration(days: 1));
                      });
                    },
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text('Morgen'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2C5F6F),
                      side: BorderSide(
                        color: const Color(0xFF2C5F6F).withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Belegungsliste
          Expanded(
            child: occupations.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_available,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Keine Belegungen',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Dieser Raum ist an diesem Tag frei',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: occupations.length,
                    itemBuilder: (context, index) {
                      final occupation = occupations[index];
                      final endTime = occupation.date.add(occupation.duration);
                      final isNow = _isOccupationNow(occupation);
                      final isPast = DateTime.now().isAfter(endTime);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: isNow 
                              ? const Color(0xFF5EB3C7).withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isNow 
                                ? const Color(0xFF5EB3C7)
                                : isPast 
                                    ? Colors.grey[300]!
                                    : const Color(0xFF2C5F6F).withOpacity(0.3),
                            width: isNow ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isNow
                                          ? const Color(0xFF5EB3C7)
                                          : isPast
                                              ? Colors.grey[400]
                                              : const Color(0xFF2C5F6F),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '${_formatTime(occupation.date)} - ${_formatTime(endTime)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${occupation.duration.inMinutes} Min',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const Spacer(),
                                  if (isNow)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF5EB3C7),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'Läuft',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                occupation.eventName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isPast 
                                      ? Colors.grey[600]
                                      : const Color(0xFF2C5F6F),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: isPast 
                                        ? Colors.grey[500]
                                        : const Color(0xFF5EB3C7),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    occupation.instructor,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isPast 
                                          ? Colors.grey[600]
                                          : const Color(0xFF2C5F6F),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  bool _isOccupationNow(Occupation occupation) {
    final now = DateTime.now();
    final end = occupation.date.add(occupation.duration);
    return now.isAfter(occupation.date) && now.isBefore(end);
  }
}