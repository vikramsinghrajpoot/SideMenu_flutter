class Notes {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Notes({this.userId, this.id, this.title, this.completed});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}
