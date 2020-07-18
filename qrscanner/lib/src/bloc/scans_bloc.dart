import 'dart:async';

import 'package:qrscanner/src/bloc/validator.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();
  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    //Obtener scans de la base de datos
    obtenerScans();
  }

  //Flujo de datos
  //Esepcificar los tipos de datos
  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();
  //Pasar filtro a los streams
  Stream<List<ScanModel>> get scansStream =>
      _scansStreamController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp =>
      _scansStreamController.stream.transform(validarHttp);

  dispose() {
    _scansStreamController?.close();
  }

  obtenerScans() async {
    _scansStreamController.sink.add(await DBProvider.db.getTodosScans());
  }

  borrarScans(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borarrAllScans() async {
    //Purga toda la abse de datos
    await DBProvider.db.deleteAll();
    obtenerScans();
  }

  agregarScans(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }
}
