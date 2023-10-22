import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:vicada_clone/pages/chat_page.dart';
import 'package:vicada_clone/pages/homd.dart';
import 'package:vicada_clone/widgets/local_stack_widget.dart';
import 'package:vicada_clone/widgets/under_line_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneTotalWidth = MediaQuery.of(context).size.width;
    final phoneTotalHeight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [const Home(), const ChatPage()]; // ChatPage 추가

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 30),
        leading: const Icon(
          Icons.house_outlined,
          color: Colors.purple,
          size: 45,
        ),
        actions: const [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.add_alert_rounded,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: UnderLineShadow(),
        ),
      ),
      body: pages[selectedIndex], // 선택된 페이지 표시
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: SizedBox(
      //   width: 60.0, // 원하는 너비 설정
      //   height: 60.0, // 원하는 높이 설정
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     shape: const CircleBorder(),
      //     child: const Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.add),
      //         Center(
      //           child: Text(
      //             "판매하기",
      //             style: TextStyle(fontSize: 12),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) {
          print('click index=$i');
          // 원하는 동작을 수행하도록 함수를 추가합니다.
          // 예를 들어, i에 따라 다른 화면으로 이동하거나 특정 작업을 수행할 수 있습니다.
          _onItemTapped(i);
        },
      ),
    );
  }
}
