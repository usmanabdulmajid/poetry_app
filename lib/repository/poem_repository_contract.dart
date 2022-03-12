import 'package:poetry_app/model/poem.dart';

abstract class PoemRepositoryContract {
  Future<List<String>> poets();
  Future<List<String>> searchPoet(String name);
  Future<List<Poem>> poems(String author);
}
