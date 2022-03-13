import 'package:flutter/cupertino.dart';
import 'package:poetry_app/core/exception/api_exceptions.dart';
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
  bool networkError = false;

  void poets() async {
    try {
      networkError = false;
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
      poetList = await poemRepository.poets();
      loading = false;
    } on NetworkException {
      networkError = true;
      loading = false;
    }
    notifyListeners();
  }

  void poems(String poet) async {
    try {
      networkError = false;
      loading = true;
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
      poemList = await poemRepository.poems(poet);
      loading = false;
    } on NetworkException {
      networkError = true;
      loading = false;
    }
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
