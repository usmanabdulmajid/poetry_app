import 'package:poetry_app/model/poetry.dart';

abstract class RemoteDataSourceContract {
  Future<List<String>> authors();
  Future<List<Poetry>> authorPoems(String authorName);
}
