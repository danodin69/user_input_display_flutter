import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  

  const UserInput({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => const UserInput(),
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserInputPage(),
    );
  }
}

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final _textFieldController = TextEditingController();
  String defaultText = "Tap To Edit";
  bool _isUserTyping = false;
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Center(child: _textEditSystem()),
      ),
    );
  }

  Widget _textEditSystem() {
    if (_isUserTyping) {
      return Center(
        child: TextField(
          textAlign: TextAlign.center,
          onSubmitted: (newValue) {
            setState(() {
              defaultText = newValue;
              _isUserTyping = false;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusColor: Colors.transparent,
            hintText: 'Type Your Mind',
            hintTextDirection: TextDirection.ltr,
            hintStyle: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: 21),
          ),
          controller: _textFieldController,
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isUserTyping = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          defaultText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
 
