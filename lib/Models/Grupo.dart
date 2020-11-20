class Grupo{
  int cdGrupo;
  String nmGrupo;
  String dtInclusao;

  Grupo({this.cdGrupo, this.nmGrupo, this.dtInclusao});

  Map<String, dynamic> toJson() =>
  {
    'cdGrupo': this.cdGrupo,
    'nmGrupo': this.nmGrupo,
    'dtInclusao': this.dtInclusao
  };

  factory Grupo.fromJson(Map<String, dynamic> parsedJson) => Grupo(
    cdGrupo: parsedJson['cdGrupo'],
    nmGrupo: parsedJson['nmGrupo'],
    dtInclusao: parsedJson['dtInclusao']
  );
}