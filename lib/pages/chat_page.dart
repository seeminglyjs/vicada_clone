import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
      ),
      body: Column(
        children: [
          // 채팅 내용을 표시하는 위젯
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 채팅 메시지 개수
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('채팅 메시지 $index'),
                );
              },
            ),
          ),
          // 채팅 입력창
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '메시지 입력',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // 메시지 전송 로직을 추가
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
