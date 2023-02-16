import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //第一种样式写法
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.blue),
              //   foregroundColor: MaterialStateProperty.all(Colors.white),
              // ),
              //第二种写法
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                print('Pressed raised ElevatedButton');
              },
              child: Text('A Elevate Button'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('A Text Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('A Outlined Button'),
            )
          ],
        ),
      ),
    );
  }
}
