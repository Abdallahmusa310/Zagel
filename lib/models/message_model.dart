class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(jsondata) {
    return MessageModel(jsondata['message'], jsondata['id']);
  }
}
