import 'package:get/get.dart';

import '../models/data_model.dart';

class DataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Data.fromJson(map);
      if (map is List) return map.map((item) => Data.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json';
  }

  Future<Response> getData() async {
    final response = await get('https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json');
    return response;
  }

  Future<Data?> getDataById(int id) async {
    final response = await get('data/$id');
    return response.body;
  }

  Future<Response<Data>> postData(Data data) async => await post('data', data);
  Future<Response> deleteData(int id) async => await delete('data/$id');
}
