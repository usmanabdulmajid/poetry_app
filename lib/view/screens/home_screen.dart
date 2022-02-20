import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poets'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(top: 10, right: 16, left: 16, bottom: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'William Allingham',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
