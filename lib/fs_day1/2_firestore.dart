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
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore fs = FirebaseFirestore.instance;

    Future<void> addUser() async{
      if(nameCtrl.text.isNotEmpty && ageCtrl.text.isNotEmpty){
        Map<String, dynamic> user = {
          "name" : nameCtrl.text,
          "age" : int.tryParse(ageCtrl.text) ?? 0,
        };

        await fs.collection("users").add(user);

        nameCtrl.clear();
        ageCtrl.clear();
      }
    }

    Future<void> deleteUser(String id) async{
      await fs.collection("users").doc(id).delete();
    }

    Future<void> updateUser() async{

      var users = await fs.collection("users");
      var snap = await users
                    .where("name", isEqualTo: nameCtrl.text)
                    .get();

      for(var doc in snap.docs){
        users.doc(doc.id).update({
          "age" : int.parse(ageCtrl.text)
        });
      }
    }

    Widget getUserList() {

      return StreamBuilder(
        stream: fs.collection("users").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: SizedBox(
                width: 40.0,  // 원하는 가로 크기
                height: 40.0, // 원하는 세로 크기
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((doc){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("문서 ID : ${doc.id}"),
                subtitle: Text("이름 : ${doc["name"]}, 나이 : ${doc["age"]}"),
                trailing: IconButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("삭제"),
                          content: Text("정말 삭제하시겠습니까?"),
                          actions: [
                            TextButton(
                              onPressed: () async{
                                await deleteUser(doc.id);
                                Navigator.of(context).pop();
                              },
                              child: Text("삭제")
                            ),TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("취소"),
                            )
                          ]
                        );
                      }
                    );
                  },
                  icon: Icon(Icons.delete)
                ),
              );
            }).toList() //[]
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("파이어스토어!")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: "이름",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: ageCtrl,
                  decoration: InputDecoration(
                      labelText: "나이",
                      border: OutlineInputBorder()
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        addUser();
                      },
                      child: Text("저장")
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: (){
                        updateUser();
                      },
                      child: Text("수정")
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Expanded(child: getUserList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
