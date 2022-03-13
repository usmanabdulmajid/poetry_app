import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_app/core/routes/app_routes.dart';
import 'package:poetry_app/core/utils/extensions.dart';
import 'package:poetry_app/core/utils/sizing.dart';
import 'package:poetry_app/viewmodel/poem_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController nameController;
  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poets', style: GoogleFonts.acme(letterSpacing: 1)),
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
                child: TextField(
                  style: GoogleFonts.acme(),
                  decoration: const InputDecoration(
                    hintText: 'search poet',
                    border: InputBorder.none,
                  ),
                  onChanged: (name) {
                    context.read<PoemProvider>().searchPoet(name);
                  },
                ),
              ),
              const YGap(20),
              Consumer<PoemProvider>(builder: (context, model, child) {
                if (model.loading) {
                  return const Expanded(
                    child: Center(
                      child: SpinKitSpinningLines(color: Colors.green),
                    ),
                  );
                }
                if (model.networkError) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const YGap(100),
                        Image.asset(
                          'images/wifi.png',
                          width: 150,
                          height: 150,
                        ),
                        Text('No Internet', style: GoogleFonts.acme()),
                        IconButton(
                            onPressed: () async {
                              context.read<PoemProvider>().poets();
                            },
                            icon: const Icon(Icons.refresh))
                      ]);
                }
                if (model.poetList.isEmpty) {
                  return Expanded(
                      child: Center(
                          child: Text('No poet found',
                              style: GoogleFonts.acme())));
                }
                return Expanded(
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
                    itemCount: model.poetList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<PoemProvider>()
                              .poems(model.poetList[index]);
                          Navigator.pushNamed(context, AppRoute.poet,
                              arguments: model.poetList[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: const BoxDecoration(
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
                          child: Text(model.poetList[index],
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
