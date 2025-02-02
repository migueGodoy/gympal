import 'package:gympal/modules/workout-exercise/domain/workout-exercise.dart';

class WorkOut {
  String id;
  DateTime date;
  List<WorkoutExercise> exercises;
  int duration; // in minutes
  String? notes;

  WorkOut({
    required this.id,
    required this.date,
    this.exercises = const [],
    this.duration = 0,
    this.notes,
  });

  void addExercise(WorkoutExercise exercise) {
    exercises.add(exercise);
  }

  void removeExercise(WorkoutExercise exercise) {
    exercises.removeWhere((e) => e.id == exercise.id);
  }

  void updateDuration(int newDuration) {
    duration = newDuration;
  }

  void addNotes(String newNotes) {
    notes = newNotes;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'exercises': exercises.map((e) => e.toMap()).toList(),
      'duration': duration,
      'notes': notes,
    };
  }

  static WorkOut fromMap(Map<String, dynamic> map) {
    return WorkOut(
      id: map['id'],
      date: DateTime.parse(map['date']),
      exercises: (map['exercises'] as List).map((e) => WorkoutExercise.fromMap(e)).toList(),
      duration: map['duration'],
      notes: map['notes'],
    );
  }
}