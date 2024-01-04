import 'package:hive/hive.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/core_module/data/local/hive_box/login_akun_box/login_akun_box.dart';
import 'package:novandi/core_module/data/local/hive_box/registered_akun_box/registered_akun_box.dart';
import 'package:novandi/home_module/presentation/pages/home_page.dart';

abstract class LocalDataSource {
  Future<List<Map<String, dynamic>>?> get registeredAkun;

  Future<Map<String, dynamic>?> get loginAkun;

  Future<void> registerAkunLocal({required Map<String, dynamic> data});

  Future<void> changeDataItemRegisterAkunLocal(
      {required Map<String, dynamic> data});

  Future<void> signInAkunLocal({required Map<String, dynamic> data});

  Future<void> setLoginAkun({required Map<String, dynamic> data});

  Future<void> logOutAkun();

  Future<String> isLoginNavigator();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> registerAkunLocal({required Map<String, dynamic> data}) async {
    try {
      var value =
          await Hive.openBox<RegisteredAkunBox>(RegisteredAkunBox.boxName);
      if (value.values.isNotEmpty) {
        bool isExist = (value.getAt(0)!.listAkun!.any(
              (e) => e['username'] == data['username'],
            ));
        if (isExist == false) {
          value.putAt(
            0,
            RegisteredAkunBox(listAkun: [...?value.getAt(0)?.listAkun, data]),
          );
        } else {
          if (isExist) {
            throw 'Username Sudah Terdaftar';
          } else {
            throw 'REGISTRASI GAGAL';
          }
        }
      } else {
        value.add(RegisteredAkunBox(
          listAkun: [data],
        ));
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> get registeredAkun async {
    Box<RegisteredAkunBox> box =
        await Hive.openBox<RegisteredAkunBox>(RegisteredAkunBox.boxName);
    return box.values.isNotEmpty ? box.getAt(0)?.listAkun : [];
  }

  @override
  Future<void> signInAkunLocal({required Map<String, dynamic> data}) async {
    try {
      var listAkun = await registeredAkun;

      bool isExist = ((listAkun ?? []).any(
        (e) => e['username'] == data['username'],
      ));
      bool passwordSalah = ((listAkun ?? []).any(
        (e) =>
            e['username'] == data['username'] &&
            e['password'] != data['password'],
      ));

      if (isExist == false) {
        throw 'Akun Belum Terdaftar';
      } else if (isExist == true) {
        if (passwordSalah) {
          throw 'Password Salah';
        } else {
          setLoginAkun(data: data);
        }
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> get loginAkun async {
    Box<LoginAkunBox> box =
        await Hive.openBox<LoginAkunBox>(LoginAkunBox.boxName);
    return box.values.isNotEmpty ? box.getAt(0)?.loginAkun : null;
  }

  @override
  Future<void> logOutAkun() async {
    Box<LoginAkunBox> boxLoginAkun =
        await Hive.openBox<LoginAkunBox>(LoginAkunBox.boxName);
    boxLoginAkun.clear();
  }

  @override
  Future<String> isLoginNavigator() async {
    Map<String, dynamic>? box = await loginAkun;
    return (box != null) ? HomePage.routeName : LoginPage.routeName;
  }

  @override
  Future<void> setLoginAkun({required Map<String, dynamic> data}) async {
    Box<LoginAkunBox> box = await Hive.openBox<LoginAkunBox>(LoginAkunBox.boxName);

    List<Map<String, dynamic>>? listAkun = await registeredAkun;

    Map<String, dynamic>? akunData = listAkun?.firstWhere((element) => (element['username'] == data['username']) && (element['password'] == data['password']) );

    if (box.values.isNotEmpty) {
      box.putAt(0, LoginAkunBox(loginAkun: akunData));
    } else {
      box.add(LoginAkunBox(loginAkun: akunData));
    }
  }

  @override
  Future<void> changeDataItemRegisterAkunLocal(
      {required Map<String, dynamic> data}) async {
    List<Map<String, dynamic>>? listAkun = await registeredAkun;
    int indexChange = listAkun!.indexWhere((element) => element['id'] == data['id']);
    listAkun[indexChange] = data;

    try {
      var value =
          await Hive.openBox<RegisteredAkunBox>(RegisteredAkunBox.boxName);
      value.putAt(
        0,
        RegisteredAkunBox(listAkun: listAkun),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
