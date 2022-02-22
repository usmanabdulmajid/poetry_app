import 'package:poetry_app/data/api/api_client.dart';
import 'package:poetry_app/data/data_source/remote/remote_data_source.dart';
import 'package:poetry_app/data/model/poetry.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiClient apiClient;
  RemoteDataSourceImp(this.apiClient);
  @override
  Future<Poetry> authorPoems(String authorName) async {
    // TODO: implement authorPoems
    throw UnimplementedError();
  }

  @override
  Future<List<String>> authors() {
    // TODO: implement authors
    throw UnimplementedError();
  }
}
