import 'dart:math';

import 'package:bridel_inventory/navigation_helper.dart';
import 'package:bridel_inventory/screens/inventory_screen.dart';
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
            children: List.generate(9, (index) {
              final randomColor = Color.fromARGB(
                255,
                rand.nextInt(256),
                rand.nextInt(256),
                rand.nextInt(256),
              );

              return TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.thumb_up, color: Colors.white),
                          Text('You pressed button'),
                          SizedBox(),
                        ],
                      ),
                      showCloseIcon: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      behavior: SnackBarBehavior.floating,
                      width: 300,
                      elevation: 0,
                      backgroundColor: randomColor,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 30, color: randomColor),
                ),
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(const InventoryScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Go to Inventory'),
          ),
        ],
      ),
    );
  }
}
