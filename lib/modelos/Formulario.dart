import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Formulario extends StatelessWidget {
  const Formulario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Formulario de reserva en hotel'),
          backgroundColor: Colors.white70,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),

      ),
      body: SingleChildScrollView(
          child: FormularioRegistro(),
      ));
  }
}

class FormularioRegistro extends StatefulWidget {
  @override
  FormularioRegistroState createState() {
    return FormularioRegistroState();
  }
}

class FormularioRegistroState extends State<FormularioRegistro> {
  // Permite la validacion del formulario con un identificador unico
  final _formKey = GlobalKey<FormState>();
  var mapaDatos = new Map<String, dynamic>();

  //Permite el envío de informacion
  postTest() async {
    final enlace = 'http://192.168.0.110:8000/api/hoteles/form';

    http.Response response = await http.post(
      Uri.parse(enlace),
      body: mapaDatos,
    );

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Escriba su nombre completo',
              labelText: 'Nombre',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese su nombre';
              } else {
                mapaDatos['nombre'] = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Escriba su correo electronico',
              labelText: 'Correo electronico',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese su correo';
              } else {
                mapaDatos['correo'] = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Escriba un telefono de contacto',
              labelText: 'Telefono',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese un numero de telefono';
              } else {
                mapaDatos['telefono'] = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person_add),
              hintText: 'Escriba el numero de personas a registrarse',
              labelText: 'Numero de personas',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese una cantidad';
              } else {
                mapaDatos['personas_alojarse'] = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Escriba su fecha de llegada',
              labelText: 'Fecha de llegada',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese una fecha valida';
              } else {
                mapaDatos['fecha_llegada'] = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Escriba su fecha de salida',
              labelText: 'Fecha de salida',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, ingrese una fecha valida';
              } else {
                mapaDatos['fecha_salida'] = value;
              }
              return null;
            },
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new ElevatedButton(
                child: const Text('Enviar Datos'),
                onPressed: () {
                  // Valida si el formulario es apto para enviarse
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Datos enviados correctamente!')));
                    postTest();
                  }
                },
              )),
        ],
      ),
    );
  }
}