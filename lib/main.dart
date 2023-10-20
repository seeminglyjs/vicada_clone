import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "나만의 지역 리스트",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.filter_list_rounded)
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // 가로 스크롤을 가능하게 함
                  child: Row(
                    children: [
                      for (var i = 0; i < 10; i++)
                        const LocalStack(
                            imgUrl: 'https://picsum.photos/250?image=9',
                            centerText: "서울"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const UnderLineShadow(),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 15),
                            child: Row(
                              children: [
                                Image.network(
                                  "https://picsum.photos/250?image=9",
                                  width: 150, // 이미지의 가로 크기를 조절
                                  height: 150, // 이미지의 세로 크기를 조절
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8, bottom: 8),
                                  child: SizedBox(
                                    width: 200,
                                    height: 150, // 이미지의 세로 크기를 조절
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "서울숙소1",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              size: 17,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "10월 19일 ~ 10월 21일 (2박)",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "8,0000원",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const UnderLineShadow();
              },
            ),
          )
        ],
      ),
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
                IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                const SizedBox(width: 40), // The dummy child
                IconButton(
                    icon: const Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: const Icon(Icons.message), onPressed: () {}),
              ],
            ),
          )),
    );
  }
}
