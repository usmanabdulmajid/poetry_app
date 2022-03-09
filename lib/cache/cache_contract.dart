import 'package:poetry_app/model/poetry.dart';

abstract class CacheContract {
  Future<void> cacheNames(List<String> poets);
  Future<List<String>> poets();
  Future<void> cachePoetry(List<Poetry> poems);
  Future<List<Poetry>> poems(String poet);
}
