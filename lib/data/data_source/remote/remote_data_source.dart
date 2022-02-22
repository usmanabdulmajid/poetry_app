import 'package:poetry_app/data/model/poetry.dart';

abstract class RemoteDataSource {
  Future<Poetry> authorPoems(String authorName);
  Future<List<String>> authors();
}
