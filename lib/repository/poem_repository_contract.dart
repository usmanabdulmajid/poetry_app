import 'package:poetry_app/model/poem.dart';

abstract class PoemRepositoryContract {
  Future<List<String>> authors();
  Future<List<Poem>> poems(String author);
}
