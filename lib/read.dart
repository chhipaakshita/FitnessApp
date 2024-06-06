import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'learn.dart';

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String? _content;
  //  "Read" button is pressed
  Future<void> _readData() async {
    final dirPath = await _getDirPath();
    final myFile = File('$dirPath/data.txt');
    final data = await myFile.readAsString(encoding: utf8);
    setState(() {
      _content = data;
    });
  }
  Future<String> _getDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  final _textController = TextEditingController();
  // when "Write" button  pressed
  Future<void> _writeData() async {
    final dirPath = await _getDirPath();
    final myFile = File('$dirPath/data.txt');
    print(dirPath);
    // If data.txt doesn't exist, it will be created automatically
    await myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Read and write file'),
      actions: [
        IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Learn()));
        }, icon: Icon(Icons.read_more))
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              child: const Text('Save to file'),
              onPressed: _writeData,
            ),
            const SizedBox(
              height: 150,
            ),
            Text(_content ?? 'Press the button to load your name',
                style: const TextStyle(fontSize: 15, color: Colors.redAccent)),
            ElevatedButton(
              child: const Text('Read saved name from the file'),
              onPressed: _readData,
            )
          ],
        ),
      ),
    );
  }
}
