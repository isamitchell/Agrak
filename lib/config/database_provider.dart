import 'package:isar/isar.dart';
import 'package:agrak_flutter_challenge/domain/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );
  return isar;
}

@riverpod
Isar db(DbRef ref) {
  final isar = Isar.getInstance();

  if (isar == null) {
    throw Exception('Isar no Inicializado');
  }
  return isar;
  print('isar funciona');
}
