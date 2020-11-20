import 'package:http/http.dart';

class Evento{
   int CdEvento;
   int CdTipoEvento;
   String NmEvento;
   String NmEndereco;
   double VlEvento;
   double VlNota;
   bool DvParticular;

   Evento({this.CdEvento, this.CdTipoEvento, this.DvParticular, this.NmEndereco, this.NmEvento, this.VlEvento, this.VlNota});

   factory Evento.fromJson(Map<String, dynamic> parsedJson) => Evento(
       CdEvento: parsedJson['CdEvento'],
       CdTipoEvento : parsedJson['CdTipoEvento'],
       NmEvento : parsedJson['NmEvento'],
       NmEndereco : parsedJson['NmEndereco'],
       VlEvento : parsedJson['VlEvento'],
       VlNota : parsedJson['VlNota'],
       DvParticular: parsedJson['DvParticular']
   );

   Map<String, dynamic> toJson() =>
   {
       'CdEvento': this.CdEvento,
       'CdTipoEvento': this.CdTipoEvento,
       'NmEvento': this.NmEvento,
       'NmEndereco': this.NmEndereco,
       'VlEvento': this.VlEvento,
       'VlNota': this.VlNota,
       'DvParticular': this.DvParticular
   };
}