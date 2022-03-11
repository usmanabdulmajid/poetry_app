import 'package:poetry_app/model/poem.dart';

abstract class CacheContract {
  Future<void> cacheNames(List<String> poets);
  Future<List<String>> poets();
  Future<void> cachePoetry(List<Poem> poems);
  Future<List<Poem>> poems(String poet);
}
