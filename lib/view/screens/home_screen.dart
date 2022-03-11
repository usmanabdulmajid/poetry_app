import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_app/cache/sql_cache.dart';
import 'package:poetry_app/core/api/api_client.dart';
import 'package:poetry_app/core/routes/app_routes.dart';
import 'package:poetry_app/core/utils/extensions.dart';
import 'package:poetry_app/core/utils/sizing.dart';
import 'package:poetry_app/repository/poem_repository_imp.dart';
import 'package:poetry_app/viewmodel/poem_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // PoemRepositoryImp remoteDataSourceImp =
    //     PoemRepositoryImp(ApiClient(), SqlCache());
    // remoteDataSourceImp.poems('Lisle Bowles').then((value) => print(value));
    super.initState();
  }

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
              Consumer<PoemProvider>(builder: (context, poem, child) {
                if (poem.loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
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
                    itemCount: poem.poetList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<PoemProvider>()
                              .poems(poem.poetList[index]);
                          Navigator.pushNamed(context, AppRoute.poet,
                              arguments: poem.poetList[index]);
                        },
                        child: Container(
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
                          child: Text(poem.poetList[index],
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
              })
            ],
          ),
        ),
      ),
    );
  }
}
