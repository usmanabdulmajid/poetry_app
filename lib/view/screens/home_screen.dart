import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_app/utils/extensions.dart';
import 'package:poetry_app/utils/sizing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poets'),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.screenHeight(),
          width: context.screenWidth(),
          child: Column(
            children: [
              const YGap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green)),
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'search poet',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const YGap(20),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 10, right: 16, left: 16, bottom: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: context.isPortrait ? 3 / 2 : 5 / 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightGreen,
                            Colors.green,
                          ],
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Text('William Allingham',
                          style: GoogleFonts.acme(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
