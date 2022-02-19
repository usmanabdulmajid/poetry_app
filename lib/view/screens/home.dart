import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poets'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
        padding: EdgeInsets.all(12),
        crossAxisCount: 2,
        children: [
          Container(
            padding: EdgeInsets.all(29),
            width: MediaQuery.of(context).size.width,
            child: const Text('Bankai'),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            padding: EdgeInsets.all(29),
            width: MediaQuery.of(context).size.width,
            child: const Text('Bankai'),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            padding: EdgeInsets.all(29),
            width: MediaQuery.of(context).size.width,
            child: const Text('Bankai'),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            padding: EdgeInsets.all(29),
            width: MediaQuery.of(context).size.width,
            child: const Text('Bankai'),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }
}
