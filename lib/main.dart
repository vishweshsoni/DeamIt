import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleLoading(),
    );
  }
}

class SimpleLoading extends StatefulWidget {
  @override
  _SimpleLoadingState createState() => _SimpleLoadingState();
}

class _SimpleLoadingState extends State<SimpleLoading> {
  List myList;
  ScrollController _scrollController = new ScrollController();
  int _currentMax= 10;
  @override
  void initState() {
    myList = List.generate(10, (i) => "Item : ${i + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  _getMoreData() {
    for(int i=_currentMax;i<_currentMax+10;i++){
        myList.add("Item : ${i+1 }");
    }
    _currentMax = _currentMax+10;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lazy Loading"),
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemExtent: 80,
          itemCount: myList.length+1,
          itemBuilder: (context, i) {
            if(i==myList.length){
                return CupertinoActivityIndicator();
            }
            return ListTile(
              title: Text(myList[i]),
            );
          }),
    );
  }
}
