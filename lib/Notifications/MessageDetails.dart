class MessageDetails {
  int id;
  String title;
  String body;
  int hour;
  int minute;
  int? day;
  int? year;
  int? month;
  bool repeats;
  int active;
  MessageDetails({
    required this.id,
    required this.title,
    required this.body,
    required this.hour,
    required this.minute,
    this.repeats = false,
    this.active = 1,
    this.day,
    this.month,
    this.year,
  });
}
