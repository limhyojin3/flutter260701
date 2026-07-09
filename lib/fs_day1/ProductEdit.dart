import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'ProductList.dart';

class ProductEdit extends StatefulWidget {
  final String docId;
  const ProductEdit({super.key, required this.docId});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  var productName = TextEditingController();
  var category = TextEditingController();
  var price = TextEditingController();
  var info = TextEditingController();

  Future<void> insertProduct() async{
    await fs.collection("Product").add({
      "productName" : productName.text,
      "category" : category.text,
      "price" : int.parse(price.text),
      "info" : info.text
    });
  }

  Future<void> loadProductData() async {
    var doc = await fs.collection("Product").doc(widget.docId).get(); //pk로 검색해서 단일객체..
    if(doc.exists){
      setState(() {
        productName.text = doc["productName"];
        category.text = doc["category"];
        price.text = doc["price"].toString();
        info.text = doc["info"];
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProductData();
  }

  Future<void> updateProduct() async {
    await fs.collection("Product").doc(widget.docId).update({
      "productName" : productName.text,
      "category" : category.text,
      "price" : int.parse(price.text),
      "info" : info.text
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제품 수정'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductList())
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// 제품 정보
            Text(
              '제품 정보',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: productName,
              decoration: InputDecoration(
                labelText: '제품명',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: category,
              decoration: InputDecoration(
                labelText: '카테고리',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '가격',
                prefixText: '₩ ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 12), // 섹션 간 기본 간격

            /// 상세 설명
            Text(
              '상세 설명',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: info,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: '제품에 대한 설명을 입력해주세요',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 12), // 버튼과 입력 필드 사이 간격

            /// 등록 버튼
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: updateProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  '제품 수정하기',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}