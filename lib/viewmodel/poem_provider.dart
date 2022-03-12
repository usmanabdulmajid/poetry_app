import 'package:flutter/cupertino.dart';
import 'package:poetry_app/model/poem.dart';
import 'package:poetry_app/repository/poem_repository_contract.dart';

class PoemProvider extends ChangeNotifier {
  final PoemRepositoryContract poemRepository;
  PoemProvider(this.poemRepository) {
    poets();
  }
  List<Poem> poemList = [];
  List<String> poetList = [];
  bool loading = true;

  void poets() async {
    await Future.delayed(const Duration(seconds: 1));
    poetList = await poemRepository.poets();
    loading = false;
    notifyListeners();
  }

  void poems(String poet) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 1));
    poemList = await poemRepository.poems(poet);
    loading = false;
    notifyListeners();
  }

  void searchPoet(String name) async {
    loading = true;
    await Future.delayed(const Duration(seconds: 1));
    poetList = await poemRepository.searchPoet(name);
    loading = false;
    notifyListeners();
  }
}
