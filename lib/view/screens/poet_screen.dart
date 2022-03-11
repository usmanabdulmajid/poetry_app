import 'package:flutter/material.dart';
import 'package:poetry_app/core/routes/app_routes.dart';
import 'package:poetry_app/core/utils/sizing.dart';
import 'package:poetry_app/viewmodel/poem_provider.dart';
import 'package:provider/provider.dart';

class PoetScreen extends StatelessWidget {
  final String poet;
  const PoetScreen({required this.poet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('poems of $poet'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Consumer<PoemProvider>(builder: (context, poem, child) {
          if (poem.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: poem.poemList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.read,
                      arguments: poem.poemList[index]);
                },
                child: Container(
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
                          Text(poem.poemList[index].linecount),
                        ],
                      ),
                      const YGap(5),
                      Text(
                        poem.poemList[index].title,
                        style: const TextStyle(
                            color: Colors.lightGreen,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        poem.poemList[index].lines.join('\n'),
                        maxLines: 2,
                        style: const TextStyle(height: 2.0),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 16,
                endIndent: 16,
              );
            },
          );
        }));
  }
}
