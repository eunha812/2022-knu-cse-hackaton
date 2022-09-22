import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Text('홈화면'),
          ],
        ),
      ),
    );
  }
}
