import 'package:flutter/material.dart';
import 'package:vicada_clone/widgets/local_stack_widget.dart';
import 'package:vicada_clone/widgets/under_line_shadow.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
    );
  }
}
