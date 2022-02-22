import 'package:flutter/material.dart';
import 'package:poetry_app/utils/sizing.dart';

class PoetScreen extends StatelessWidget {
  const PoetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('poetry of wiiliam turner'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poem ${index + 1}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('16 lines'),
                  ],
                ),
                const YGap(5),
                const Text(
                  'Summer begins to have the look',
                  style: TextStyle(
                      color: Colors.lightGreen, fontStyle: FontStyle.italic),
                ),
                const Text(
                  "Summer begins to have the look"
                  "Peruser of enchanting Book"
                  "Reluctantly but sure perceives"
                  "A gain upon the backward leaves --",
                  maxLines: 2,
                  style: TextStyle(height: 2.0),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: 17,
      ),
    );
  }
}
