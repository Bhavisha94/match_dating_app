class ChatListModel {
  final String image;
  final String name;
  final bool sender;
  final String time;
  final String pendingMsg;
  final String msg;

  ChatListModel(
      {required this.image,
      required this.name,
      required this.sender,
      required this.time,
      required this.pendingMsg,
      required this.msg});
}
