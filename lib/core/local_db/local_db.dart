import 'package:poetry_app/model/poem.dart';

abstract class LocalDb {
  Future<void> cacheNames(List<String> poets);
  Future<List<String>> poets();
  Future<List<String>> searchPoet(String name);
  Future<void> cachePoetry(List<Poem> poems);
  Future<List<Poem>> poems(String poet);
}
