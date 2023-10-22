import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:uuid/uuid.dart';
import 'package:vicada_clone/class/msg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  StompClient? stompClient;
  final socketUrl = 'ws://localhost:8080/gs-guide-websocket';
  final uuid = const Uuid();

  void onConnect(StompFrame frame) {
    stompClient!.subscribe(
        destination: '/topic/greetings',
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> obj = json.decode(frame.body!);
            Msg message = Msg(content: obj['content'], uuid: obj['uuid']);
            setState(() => list.add(message));
          }
        });
  }

  sendMessage() {
    setState(() {
      try {
        stompClient!.send(
            destination: '/app/hello',
            body: json
                .encode({"content": controller.value.text, "uuid": uuid.v4()}));
      } catch (e) {
        // 예외가 발생한 경우 실행될 코드
        print("예외가 발생했습니다: $e");
        // 예외 처리 또는 로깅을 수행하거나 다른 작업을 수행할 수 있습니다.
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig(
        url: socketUrl,
        onConnect: onConnect,
        onWebSocketError: (dynamic error) => print("에러$error"),
      ));
      stompClient!.activate();
    }
  }

  final TextEditingController controller = TextEditingController();
  List<Msg> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, postion) {
                  return GestureDetector(
                    child: Card(
                        child: Text(list[postion].content,
                            textAlign: list[postion].uuid == uuid.v4()
                                ? TextAlign.right
                                : TextAlign.left)),
                  );
                },
                itemCount: list.length,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            controller: controller,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration:
                                const InputDecoration(hintText: "Send Message"),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: ElevatedButton(
                            onPressed:
                                sendMessage, // 여기 사용된 sendMessage 함수는 차후 websocket 연결에서 다룹니다.
                            child: const Icon(Icons.send),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
