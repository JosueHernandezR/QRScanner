class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    this.valor,
  }) {
    //Ayuda a validar si es de una pagina web
    if (valor.contains('http')) {
      this.tipo = 'https';
    }
    //Verifica si es de un tipo geo
    else {
      this.tipo = 'geo';
    }
  }

  int id;
  String tipo;
  String valor;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}