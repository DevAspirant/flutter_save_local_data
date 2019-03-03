import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
 var myStoredData = await readData();
 print(myStoredData);

 // STOP HERE
 runApp(new MaterialApp(
   home: new Home(),
   title: 'Ammar',
 ));
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}
class HomeState extends State<Home>{

  TextEditingController myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("store data"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 55.9),
        margin: EdgeInsets.all(22.2),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: myController,
              decoration: InputDecoration(
                labelText: 'please put your name',
                icon: new Icon(
                  Icons.storage,
                  color:Colors.redAccent,
                  size: 22.2,
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 12.0)),
            new RaisedButton(onPressed: (){
              writeData(myController.text);
              print('saved');
            },
              child: new Text('save',style: TextStyle(
                fontSize: 22.2,
                color: Colors.blueGrey,
              ),),)
          ],
        ),
      ),
    );
  }
}

// this abstract class is use of find the path
Future<String> get localPath async{
  final path  = await getApplicationDocumentsDirectory(); // get the directory of the file
  return path.path;
}

// this abstract class is use of find the local file
Future<File> get localFile  async {
  final file = await getApplicationDocumentsDirectory();
  return new File('$file/data.txt');
}

// this abstract class is use of write the data inside that class
Future<File> writeData(String value) async{
  final file = await localFile;
  return file.writeAsString('$value');
}

// this abstract class is use of read the data inside that class
Future<String> readData() async{
  try{
    final file = await localFile;
    String data = await file.readAsString();
    return data;

  }catch(e){
    String e = 'error : empty file';
    return e;
}
}