import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/app/core/constants/keys.dart';

class StorageService extends GetxService {
  late GetStorage _box;
  Future<StorageService> init() async {
    _box = GetStorage();

    await _box.writeIfNull(taskKey, []);
    return this;
  }

  List read<List>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
