import 'package:flutter/material.dart';

import 'DB.dart';
import 'UserList.dart';

class UserEdit extends StatefulWidget {

  final int userId;
  //생성자
  const UserEdit({super.key, required this.userId}); //required userId

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  Future<void> _selectUser() async{
    var list = await DB.selectUser(widget.userId);
    var user = list.first; //list[0]
    setState(() {
      nameCtrl.text = user["name"];
      ageCtrl.text = user["age"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.userId);
    _selectUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title : Text("사용자 수정"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  labelText: "이름"
              ),
            ),
            TextField(
              controller: ageCtrl,
              decoration: InputDecoration(
                  labelText: "나이"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async {
                String name = nameCtrl.text;
                int age = int.tryParse(ageCtrl.text) ?? 0;
                await DB.updateUser(name, age, widget.userId);

                Navigator.pop(context, true);

                // nameCtrl.clear();
                // ageCtrl.clear();
              },
              child: Text("수정"),
            )
          ],
        ),
      ),
    );
  }
}
