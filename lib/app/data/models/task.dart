// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'task.freezed.dart';
// part 'task.g.dart';
// @freezed
// class Task with _$Task {
//   const factory Task({
//     required String? title,
//     required int? icon,
//     required String? color,
//     required List<dynamic>? todos,
//   }) = _Task;

//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
// }

import 'package:equatable/equatable.dart';


class Task extends Equatable {
  final String title;
  final String color;
  final int icon;
  final List<dynamic>? todos;

  const Task({
    required this.title,
    required this.color,
    required this.icon,
    this.todos,
  });

  Task copyWith({
    String? title,
    dynamic? color,
    int? icon,
    List<dynamic>? todos,
  }) =>
      Task(
        title: title ?? this.title,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        todos: todos ?? this.todos,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        color: json['color'],
        icon: json['icon'],
        todos: json['todos'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'color': color,
        'icon': icon,
        'todos': todos,
      };

  @override
  List<Object?> get props => [title, color, icon];
}
