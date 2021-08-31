class Hotel {
  Hotel({this.id, this.nombre, this.descripcion, this.ubicacion, this.telefono, this.correo, this.logotipo, this.fotoGoogle, this.distancia, this.nroEstrellas});

  String id;
  String nombre;
  String descripcion;
  String ubicacion;
  String telefono;
  String correo;
  String logotipo;
  String fotoGoogle;
  String distancia;
  String nroEstrellas;

  //factory Hotel.fromJson(Map<String, dynamic> json) {
  //return Hotel(id: json['id'] as String, nombre: json['nombre'] as String, descripcion: json['descripcion'] as String, ubicacion: json['ubicacion'] as String, telefono: json['telefono'] as String, correo: json['correo'] as String, logotipo: json['logotipo'] as String, fotoGoogle: json['fotoGoogle'], distancia: json['distancia'], nroEstrellas: json['nroEstrellas']);
//  }
}
