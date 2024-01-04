import 'package:hive/hive.dart';
import 'package:novandi/core_module/data/local/hive_id.dart';
part 'registered_akun_box.g.dart';

@HiveType(typeId:  HiveTypeID.registeredAkunBoxId)
class RegisteredAkunBox extends HiveObject {

  static String boxName = 'RegisteredAkunBox';

  RegisteredAkunBox({this.listAkun});

  @HiveField(0)
  List<Map<String,dynamic>>? listAkun;

}

