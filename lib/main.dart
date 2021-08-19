import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_input_demo/pages/user_input.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  final _textFieldController = TextEditingController();
  String defaultText = "Tap To Edit";
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(255, 0, 150, 72),
              Color.fromARGB(255, 0, 211, 85)
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 6,
          title: const Text('Stage 2 [Task 5]'),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Center(child: _welcomeScreen()),
      ),
    );
  }

  Widget _welcomeScreen() {
    return Stack(children: [
      const Padding(
        padding: EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'This application will take user input and set as the display text',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserInputPage(),
              ));
            },
            child: const Text('START')),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 500),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Powered By',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _goToUrl();
                },
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/zuri.png",
                      width: 50,
                      height: 50,
                    )),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  _goToUrl() async {
    String url = 'https://zuri.team';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Aww Snap! Bad Weather... url can not launch';
    }
  }
}
