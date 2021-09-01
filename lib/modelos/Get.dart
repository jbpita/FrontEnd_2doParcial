import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:frontend_2doparcial/modelos/clases/Hotel.dart';
import 'package:frontend_2doparcial/modelos/clases/Restaurante.dart';
import 'package:frontend_2doparcial/modelos/clases/Hospital.dart';

Future<List<Hotel>> getHoteles(String string) async {
  final url = Uri.parse('http://192.168.1.6:8000/api/${string}');
  var respuesta = await http.get(url);

  List<Hotel> hoteles = [];
  if (respuesta.statusCode == 200) {
    final body = jsonDecode(respuesta.body);
    print(body);
    for (var item in body['datos']) {
        //print(item);
        hoteles.add(Hotel(id: item['id'] as String, nombre: item['nombre'] as String, descripcion: item['descripcion'] as String, ubicacion: item['ubicacion'] as String, telefono: item['telefono'] as String, correo: item['correo'] as String, logotipo: item['logotipo'] as String, fotoGoogle: item['fotoGoogle'], distancia: item['distancia'], nroEstrellas: item['nroEstrellas']));
    }
    return hoteles;
  } else {
    throw Exception("Fallo la conexion con los hoteles");

  }
}

Future<List<Restaurante>> getRestaurantes(String string) async {
  final url = Uri.parse('http://192.168.1.6:8000/api/${string}');
  var respuesta = await http.get(url);

  List<Restaurante> restaurantes = [];
  if (respuesta.statusCode == 200) {
    final body = jsonDecode(respuesta.body);
    print(body);
    for (var item in body['datos']) {
        //print(item);
        restaurantes.add(Restaurante(id: item['id'] as String, nombre: item['nombre'] as String, descripcion: item['descripcion'] as String, ubicacion: item['ubicacion'] as String, telefono: item['telefono'] as String, correo: item['correo'] as String, logotipo: item['logotipo'] as String, fotoGoogle: item['fotoGoogle'], distancia: item['distancia'], nroEstrellas: item['nroEstrellas']));
    }
    return restaurantes;
  } else {
    throw Exception("Fallo la conexion con los restaurantes");

  }
}

Future<List<Hospital>> getHospitales(String string) async {
  final url = Uri.parse('http://192.168.1.6:8000/api/${string}');
  var respuesta = await http.get(url);

  List<Hospital> hospitales = [];
  if (respuesta.statusCode == 200) {
    final body = jsonDecode(respuesta.body);
    print(body);
    for (var item in body['datos']) {
      //print(item);
      hospitales.add(Hospital(id: item['id'] as String, nombre: item['nombre'] as String, descripcion: item['descripcion'] as String, ubicacion: item['ubicacion'] as String, telefono: item['telefono'] as String, correo: item['correo'] as String, logotipo: item['logotipo'] as String, fotoGoogle: item['fotoGoogle'], distancia: item['distancia'], nroEstrellas: item['nroEstrellas']));
    }
    return hospitales;
  } else {
    throw Exception("Fallo la conexion con los hospitales");

  }
}