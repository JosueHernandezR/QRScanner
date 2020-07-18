//Creación de StreamTransform
import 'dart:async';

import 'package:qrscanner/src/models/scan_model.dart';

class Validators {
  //Ingresa cierta informacion y se puede rechazar informacion para que salga diferente
  //El primer argumento es que recibimos la informacion y la salida es del mismo tipo
  //Pero sale filtrada
  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((element) => element.tipo == 'geo').toList();
    sink.add(geoScans);
  });
  final validarHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((element) => element.tipo == 'http').toList();
    sink.add(geoScans);
  });
}
