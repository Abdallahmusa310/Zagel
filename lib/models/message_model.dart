class MessageModel {
  final String message;

  MessageModel(this.message);

  factory MessageModel.fromJson(Map<String, dynamic> jsondata) {
    return MessageModel(jsondata['message']);
  }
}
