import '../../exercise/domain/exercise.dart';
import '../../series/domain/series.dart';

class WorkoutExercise {
  final String id;
  final Exercise exercise;
  final List<Series> series;

  WorkoutExercise({
    required this.id,
    required this.exercise,
    required this.series,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise': exercise.toMap(),
      'series': series.map((s) => s.toMap()).toList(),
    };
  }

  factory WorkoutExercise.fromMap(Map<String, dynamic> map) {
    return WorkoutExercise(
      id: map['id'],
      exercise: Exercise.fromMap(map['exercise']),
      series: List<Series>.from(map['series'].map((s) => Series.fromMap(s))),
    );
  }

  @override
  String toString() {
    return 'WorkoutExercise(exercise: $exercise, series: $series)';
  }
}
