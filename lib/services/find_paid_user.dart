import 'package:get_storage/get_storage.dart';

class FindPaidUser {
  final _box = GetStorage();
  final _isPaidUser = 'isPaidUser';

  //? write when a user make a payment saying true
  writeisPaidUser(bool isPaidUser) => _box.write(_isPaidUser, isPaidUser);

  //? find user paid or not
  bool checkisPaidUser() => _box.read(_isPaidUser) ?? false;

  //? Delete user paid or not detail
  deleteUserPaidDetails() => _box.remove(_isPaidUser);
}
