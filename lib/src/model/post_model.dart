class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;
  bool isRead;
  int remainingSeconds;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.isRead = false,
    this.remainingSeconds = 10,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final times = [10, 20, 25]..shuffle();

    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      remainingSeconds: times.first,
    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
    "body": body,
    "isRead": isRead,
    "remainingSeconds": remainingSeconds,
  };
}
