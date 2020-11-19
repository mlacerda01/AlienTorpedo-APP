class TipoEvento{
  int cdTipoEvento;
  String nmTipoEvento;

  TipoEvento({this.cdTipoEvento, this.nmTipoEvento});

  factory TipoEvento.fromJson(Map<String, dynamic> parsedJson) => TipoEvento(
        cdTipoEvento: parsedJson['cdTipoEvento'],
        nmTipoEvento : parsedJson['nmTipoEvento']
  );

  Map<String, String> toJson() =>
  {
    'cdTipoEvento': null,
    'nmTipoEvento': this.nmTipoEvento.toString()
  };
}
