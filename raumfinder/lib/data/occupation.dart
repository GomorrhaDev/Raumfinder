class Occupation {
  final DateTime date;       // Datum + Uhrzeit Start
  final Duration duration;   // Dauer des Events
  final String eventName;    // Name des Ereignisses
  final String instructor;   // Name des Dozenten

  Occupation({
    required this.date,
    required this.duration,
    required this.eventName,
    required this.instructor,
  });

  factory Occupation.fromJson(Map<String, dynamic> json) {
    return Occupation(
      date: DateTime.parse(json['date'] as String),
      duration: Duration(minutes: json['durationMinutes'] as int),
      eventName: json['eventName'] as String,
      instructor: json['instructor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'durationMinutes': duration.inMinutes,
      'eventName': eventName,
      'instructor': instructor,
    };
  }

  @override
  String toString() =>
      '$eventName mit $instructor am $date (${duration.inMinutes} min)';
}
