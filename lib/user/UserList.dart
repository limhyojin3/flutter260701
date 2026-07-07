import 'package:flutter/material.dart';
import 'package:flutter260629/user/UserEdit.dart';
import 'DB.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  List<Map<String, dynamic>> list = [];

  Future<void> _selectUserList() async{  //_붙이면 private
    var tempList = await DB.selectUserList();
    setState(() {
      list = tempList;
      print("selectUserList => ${list}");
      //selectUserList => [{userId: 4, name: hong, age: 30}, {userId: 5, name: kim, age: 20}]
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUserList();
    // print(list);
  }

  @override
  Widget build(BuildContext context) {

    // print(list[1]["name"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 목록"),
      ),
      body : ListView.builder(   //반복문
        itemCount: list.length,
        itemBuilder: (context, index) {

          var user = list[index];
          // Map<String, dynamic> user = list[index];

          return ListTile(
            leading: Icon(Icons.home),
            title: Text("아이디: ${user["userId"]}, 이름: ${user["name"]}"),
            subtitle: Text("나이: ${user["age"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    bool flg = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserEdit(
                              userId: user["userId"],
                            ),
                        )
                    );
                    if (flg){
                      _selectUserList();
                    }
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                              title: Text("삭제"),
                              content: Text("${user['name']}님을 정말 삭제하시겠습니까?"),
                              actions: [
                                TextButton(
                                    onPressed: () async{
                                      await DB.deleteUser(user["userId"]);
                                      Navigator.of(context).pop();
                                      _selectUserList();
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
