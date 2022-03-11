import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_app/core/utils/extensions.dart';
import 'package:poetry_app/core/utils/sizing.dart';
import 'package:poetry_app/model/poem.dart';

class ReadScreen extends StatelessWidget {
  final Poem poem;
  const ReadScreen({required this.poem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.color),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/gary-ellis-kFHhbIrviVQ-unsplash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              YGap(context.screenHeight(.2)),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth(.4)),
                child: Text(
                  poem.title,
                  style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const YGap(10),
              Text(
                poem.author,
                style: const TextStyle(color: Colors.white),
              ),
              const YGap(100),
              Text(
                poem.lines.join('\n'),
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1.0,
                      height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
