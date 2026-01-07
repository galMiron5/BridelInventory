import 'dart:math';

import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 7, 200, 148);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.title;
    Random rand = Random();
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                'Hello ${widget.title}',
                style: const TextStyle(fontSize: 30, color: primaryColor),
              ),
              Icon(
                Icons.emoji_emotions_outlined,
                color: primaryColor,
                size: 140,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: primaryColor, size: 30),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              9,
              (index) => Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(
                    250,
                    rand.nextInt(250),
                    rand.nextInt(250),
                    rand.nextInt(250),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
