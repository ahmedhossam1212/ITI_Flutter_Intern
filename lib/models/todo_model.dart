class TaskModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TaskModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
