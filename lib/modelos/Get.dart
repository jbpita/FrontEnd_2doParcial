import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:frontend_2doparcial/modelos/clases/Hotel.dart';

Future<List<Hotel>> get(String string) async {
  final url = Uri.parse('localhost:8000/api/$string');
  var respuesta = await http.get(url);

  List<Hotel> hoteles = [];
  if (respuesta.statusCode == 200) {
    final body = jsonDecode(respuesta.body);
    print(body);
    for (var item in body['datos']) {
      print(item);
      hoteles.add(Hotel(id: item['id'] as String, nombre: item['nombre'] as String, descripcion: item['descripcion'] as String, ubicacion: item['ubicacion'] as String, telefono: item['telefono'] as String, correo: item['correo'] as String, logotipo: item['logotipo'] as String, fotoGoogle: item['fotoGoogle'], distancia: item['distancia'], nroEstrellas: item['nroEstrellas']));
    }
    return hoteles;
  } else {
    throw Exception("Fallo la coneccion");
  }
  //print(res);
  //final body = jsonDecode(res.body);
  //print(body);
  //return body['datos'];
  // });
  //var body = jsonDecode(response.body);
  //return Future.value(body['datos']);
}
