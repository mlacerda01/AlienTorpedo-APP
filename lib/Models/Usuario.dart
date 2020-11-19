class Usuario{
  final int cdUsuario;
  final String nmEmail;
  final String nmUsuario;
  final String nmSenha;
  final bool dvAtivo;
  final DateTime dtInclusao;

  Usuario(this.cdUsuario, this.nmEmail, this.nmUsuario, this.dvAtivo, this.dtInclusao, this.nmSenha);

  Usuario.fromJson(Map<String, dynamic> json)
      : cdUsuario = json['cdUsuario'],
        nmUsuario = json['nmUsuario'],
        nmEmail = json['nmEmail'],
        nmSenha = json['nmSenha'],
        dvAtivo = json['dvAtivo'],
        dtInclusao = json['dtInclusao'];

      Map<String, dynamic> toJson() =>
      {
        'cdUsuario': cdUsuario,
        'nmUsuario': nmUsuario,
        'nmEmail':   nmEmail,
        'nmSenha':   nmSenha,
        'dvAtivo':   dvAtivo,
        'dtInclusao':dtInclusao
      };
}
