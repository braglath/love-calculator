import 'package:get_storage/get_storage.dart';

class GenderStorage {
  final _box = GetStorage();
  final _keyFirstGender = 'firstGender';
  final _keySecondGender = 'SecondGender';

  //? Load gender from local storage and if it's empty, returns empty string
  String loadFirstGenderFromBox() => _box.read(_keyFirstGender) ?? '';
  String loadSecondGenderFromBox() => _box.read(_keySecondGender) ?? '';

  //? Save first gender to local storage
  saveFirstGenderToBox(String firstGender) =>
      _box.write(_keyFirstGender, firstGender);
  saveSecondGenderToBox(String secondGender) =>
      _box.write(_keySecondGender, secondGender);

  //? Delete gender
  deleteFirstGender() => _box.remove(_keyFirstGender);
  deleteSecondGender() => _box.remove(_keySecondGender);
}

class LovePercentageStorage {
  final _box = GetStorage();
  final _keyPercentage = 'percentage';

  //? Save first gender to local storage
  saveLovePercentage(int percentage) => _box.write(_keyPercentage, percentage);
  int loadLovePercentage() => _box.read(_keyPercentage) ?? 0;
}
