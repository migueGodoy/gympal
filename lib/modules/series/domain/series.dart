class Series {
  final int reps;
  final double weight;
  final String notes;

  Series({
    required this.reps,
    required this.weight,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'reps': reps,
      'weight': weight,
      'notes': notes,
    };
  }

  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      reps: map['reps'],
      weight: map['weight'],
      notes: map['notes'],
    );
  }

  @override
  String toString() {
    return 'Series(reps: $reps, weight: $weight, notes: $notes)';
  }
}