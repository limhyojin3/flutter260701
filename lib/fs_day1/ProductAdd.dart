import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import '../firebase_options.dart';

void main() async {
  //Flutter 프레임워크 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("제품 등록"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.list), // 원하는 아이콘 모양
              onPressed: () {
                // 아이콘을 눌렀을 때 실행할 코드
              },
            ),
          ],
          backgroundColor: Colors.pinkAccent[100],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "제품 정보",
                  style: TextStyle(
                    fontSize: 17.0,                          // 글자 크기
                    fontWeight: FontWeight.bold,             // 글자 굵기 (bold, w500 등)
                    letterSpacing: 2.0,                      // 글자 자간 (간격)
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "제품명",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "카테고리",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "가격",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "상세 설명",
                  style: TextStyle(
                    fontSize: 17.0,                          // 글자 크기
                    fontWeight: FontWeight.bold,             // 글자 굵기 (bold, w500 등)
                    letterSpacing: 2.0,                      // 글자 자간 (간격)
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "제품에 대한 설명을 입력해주세요",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLines : 4
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity, // 가로 길이를 부모 크기만큼 꽉 채웁니다.
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,      // 버튼 배경색
                      foregroundColor: Colors.white,     // 버튼 글자색
                      padding: const EdgeInsets.symmetric(vertical: 15), // 가로 패딩은 제거하고 세로 높이만 유지
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                      ),
                    ),
                    onPressed: () {
                      // 등록 버튼 클릭 시 실행할 로직
                    },
                    child: const Text(
                      "제품 등록하기",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 글자를 조금 더 크고 진하게
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          // 해당 구역(하단바)만 NoSplash 테마를 적용합니다.
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent, // 잔상까지 깔끔하게 제거하기 위함
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '등록'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
            ],
          ),
        ),
      )
    );
  }
}
