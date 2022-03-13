import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Text('poems of $poet', style: GoogleFonts.acme()),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Consumer<PoemProvider>(builder: (context, model, child) {
          if (model.loading) {
            return const Center(
                child: SpinKitSpinningLines(color: Colors.green));
          }
          if (model.networkError) {
            return Center(
              child: Column(children: [
                const YGap(200),
                Image.asset(
                  'images/wifi.png',
                  width: 150,
                  height: 150,
                ),
                Text('No Internet', style: GoogleFonts.acme()),
                const YGap(10),
                IconButton(
                    onPressed: () async {
                      context.read<PoemProvider>().poems(poet);
                    },
                    icon: const Icon(Icons.refresh))
              ]),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: model.poemList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.read,
                      arguments: model.poemList[index]);
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
                          Text('Poem ${index + 1}',
                              style: GoogleFonts.acme(fontSize: 18)),
                          Text(model.poemList[index].linecount,
                              style: GoogleFonts.abel()),
                        ],
                      ),
                      const YGap(5),
                      Text(
                        model.poemList[index].title,
                        style: GoogleFonts.abel(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.poemList[index].lines.join('\n'),
                        maxLines: 2,
                        style: GoogleFonts.abel(
                          height: 1.5,
                        ),
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
