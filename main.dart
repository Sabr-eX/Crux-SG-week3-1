import 'package:flutter/material.dart';

import './message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Message> messages = [];
  final msgController = TextEditingController();

  void addmsg() {
    final text = msgController.text;

    final newmsg = Message(message: text, time: DateTime.now());
    setState(() {
      messages.add(newmsg);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Window'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.red,
                width: double.infinity,
                height: height - 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Text(messages[index].message),
                                subtitle: Text('You'),
                                trailing: Text(messages[index].time as String),
                              ),
                            ],
                          );
                        }),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    child: TextField(
                      controller: msgController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a message',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: addmsg,
                      icon: Icon(
                        Icons.send,
                        color: Colors.green,
                        size: 50,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
