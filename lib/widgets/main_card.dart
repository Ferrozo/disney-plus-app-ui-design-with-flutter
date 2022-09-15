import 'package:flutter/material.dart';

import '../pages/details.dart';

class MainCard extends StatefulWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  void showDetails(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DetailsPage()),
      // builder: (context) => const MyHomePage(title: 'Home Page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: 202,
          width: maxWidth,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF063A8D),
                    Color.fromARGB(221, 6, 58, 141),
                    Color(0xFF063A8D),
                  ],
                )),
            height: 165,
            width: maxWidth / 1.13,
          ),
        ),
        Positioned(
          left: maxWidth / 3.2,
          bottom: -38,
          child: Image.asset(
            'src/assets/lucas_and_friends.png',
            width: maxWidth - 160,
          ),
        ),
        Positioned(
          left: 5,
          bottom: 72,
          child: Image.asset(
            'src/assets/lucas_logo.png',
            width: 98,
          ),
        ),
        Positioned(
          left: 20,
          bottom: 17,
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(80, 254, 254, 254),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                showDetails(context);
              },
              icon: const Icon(
                Icons.play_arrow_rounded,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
