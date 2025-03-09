// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  Todo({
    required this.id,
    required this.title,
    required this.description,
     this.isCompleted =false,
  });
}
