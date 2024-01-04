import 'package:hive/hive.dart';
import 'package:novandi/core_module/data/local/hive_id.dart';

part 'login_akun_box.g.dart';

@HiveType(typeId: HiveTypeID.loginAkunBoxId)
class LoginAkunBox extends HiveObject {

  static String boxName = 'LoginAkunBox';

  LoginAkunBox({this.loginAkun});

  @HiveField(0)
  Map<String,dynamic>? loginAkun;

}

