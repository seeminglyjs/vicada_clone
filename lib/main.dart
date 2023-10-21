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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneTotalWidth = MediaQuery.of(context).size.width;
    final phoneTotalHeight = MediaQuery.of(context).size.height;

    int selectedIndex = 0;
    final List<Widget> pages = [const Home(), const ChatPage()]; // ChatPage 추가

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60.0, // 원하는 너비 설정
        height: 60.0, // 원하는 높이 설정
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Center(
                child: Text(
                  "판매하기",
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    _onItemTapped(0);
                  }),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              const SizedBox(width: 40), // The dummy child
              IconButton(
                  icon: const Icon(Icons.notifications), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    _onItemTapped(1);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
