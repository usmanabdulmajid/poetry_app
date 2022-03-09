import 'package:poetry_app/model/poetry.dart';

abstract class PoetryRepositoryContract {
  Future<List<String>> authors();
  Future<List<Poetry>> poems(String author);
}
